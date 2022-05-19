import 'package:boutiqnet/src/core/view_model/auth_view_model.dart';
import 'package:boutiqnet/src/helper/extenstion.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/view/auth/login_view.dart';

import 'package:boutiqnet/src/view/widgets/custom_text.dart';
import 'package:boutiqnet/src/view/widgets/custom_text_form_field.dart';
import 'package:boutiqnet/src/view/widgets/custom_text_gradiant.dart';
import 'package:boutiqnet/src/view/widgets/defaultbutton.dart';
import 'package:boutiqnet/src/view/widgets/lodding_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 20,
            left: 20,
          ),
          child: GetBuilder<AuthViewModel>(builder: (auth) {
            return Form(
              key: _formKey,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 400,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextGradiant(
                      text: "S’inscrire".tr,
                      fontSize:  getProportionateScreenHeight(30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: "C’est rapide et facile.".tr,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height:  getProportionateScreenHeight(30),
                    ),
                    CustomTextFormField(
                      text: 'nom complet'.tr,
                      hint: 'Med Mahmoud',
                      prefix: 'assets/icons/Icon_material-person-outline.svg',
                      onSave: (value) {
                        controller.name = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '❌ ' + 'Veuillez entrer un nom valide'.tr;
                        }
                      },
                    ),
                    SizedBox(
                      height:  getProportionateScreenHeight(30),
                    ),
                    CustomTextFormField(
                      text: "email".tr,
                      hint: 'medmahmoud@gmail.com',
                      prefix: 'assets/icons/Iconly-Curved-Message.svg',
                      onSave: (value) {
                        controller.email = value;
                      },
                      validator: (value) {
                        if (isEmail(value) == false) {
                          return '❌ ' + 'Veuillez entrer un email valide'.tr;
                        }
                      },
                    ),
                    SizedBox(
                      height:  getProportionateScreenHeight(30),
                    ),
                    CustomTextFormField(
                      text: "téléphone".tr,
                      hint: '22 33 22 33',
                      prefix: 'assets/icons/Iconly-Curved-Calling.svg',
                      keyboardtype: TextInputType.number,
                      onSave: (value) {
                        controller.phone = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '❌ ' +
                              'Veuillez entrer votre numéro de téléphone'.tr;
                        } else if (value.length < 8 || value.length > 8) {
                          return '❌ ' +
                              'Veuillez entrer un numéro de téléphone valide'
                                  .tr;
                        }
                      },
                    ),
                    SizedBox(
                      height:  getProportionateScreenHeight(30),
                    ),
                    CustomTextFormField(
                      text: "mot de passe".tr,
                      hint: "Veuillez entrer le mot de passe".tr,
                      prefix: 'assets/icons/Iconly-Curved-Password.svg',
                      keyboardtype: TextInputType.number,
                      onSave: (value) {
                        controller.password = value;
                      },
                      validator: (value) {
                        if (value.length < 3) {
                          return '❌ ' + 'Veuillez entrer un code valide'.tr;
                        }
                      },
                    ),
                    if (auth.istoVerificate)
                      SizedBox(
                        height:  getProportionateScreenHeight(30),
                      ),
                    Visibility(
                      visible: auth.istoVerificate,
                      child: CustomTextFormField(
                        text: 'Veuillez entrer votre code reçu par SMS'.tr,
                        hint: '*****',
                        prefix: 'assets/icons/Iconly-Curved-Password.svg',
                        keyboardtype: TextInputType.number,
                        onSave: (value) {
                          controller.otp = value;
                        },
                        validator: (value) {
                          if (value.length < 5) {
                            return '❌ ' + 'Veuillez entrer un code valide'.tr;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    auth.isLoading
                        ? Loddingbutton(
                            loddinColor: Theme.of(context).backgroundColor,
                            height: 50,
                          )
                        : Defaultbutton(
                            textcolor: Colors.white,
                            text: "S’inscrire".tr,
                            haveIcon: true,
                            onTap: () {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                if (!auth.istoVerificate) {
                                  auth.verifyPhone();
                                } else {
                                  auth.otpVerify();
                                }
                              }
                            },
                            color: Theme.of(context).primaryColor,
                          ),
                    SizedBox(
                      height:  getProportionateScreenHeight(30),
                    ),
                    InkWell(
                      onTap: () {
                        // Get.to(() => const Conditions());
                      },
                      child: Text.rich(TextSpan(
                          text: 'En continuant, vous acceptez \n'.tr,
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'les conditions'.tr,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' et '.tr,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            TextSpan(
                              text: 'la confidentialité'.tr,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ])),
                    ),
                    SizedBox(
                      height:  getProportionateScreenHeight(30),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
