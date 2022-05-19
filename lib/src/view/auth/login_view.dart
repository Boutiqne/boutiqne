import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/core/view_model/auth_view_model.dart';

import 'package:boutiqnet/src/core/view_model/lang_controller.dart';
import 'package:boutiqnet/src/helper/extenstion.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/view/auth/register_view.dart';
import 'package:boutiqnet/src/view/control_view.dart';

import 'package:boutiqnet/src/view/widgets/custom_text_form_field.dart';
import 'package:boutiqnet/src/view/widgets/custom_text_gradiant.dart';
import 'package:boutiqnet/src/view/widgets/defaultbutton.dart';
import 'package:boutiqnet/src/view/widgets/lodding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: getProportionateScreenHeight(30),
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: GetBuilder<AuthViewModel>(
                init: AuthViewModel(),
                builder: (auth) {
                  return Container(
                    constraints: BoxConstraints(
                      maxWidth: 400,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image.asset(
                        //   "assets/images/logo+name.png",
                        //   width: 100,
                        // ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        // CustomTextGradiant(
                        //   text: "Se connecter".tr,
                        //   fontSize: 20,
                        // ),
                        Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 80,
                          ),
                        ),
                        Center(
                            child: CustomTextGradiant(
                          text: 'B-net',
                          fontSize: 20,
                        )),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        CustomTextFormField(
                          text: "email".tr,
                          hint: 'Veuillez entrer votre email'.tr,
                          prefix: 'assets/icons/Iconly-Curved-Message.svg',
                          onSave: (value) {
                            auth.email = value;
                          },
                          validator: (value) {
                            if (isEmail(value) == false) {
                              return '❌ ' +
                                  'Veuillez entrer un email valide'.tr;
                            }
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        CustomTextFormField(
                          text: "mot de passe".tr,
                          hint: "Veuillez entrer le mot de passe".tr,
                          prefix: 'assets/icons/Iconly-Curved-Password.svg',
                          keyboardtype: TextInputType.number,
                          onSave: (value) {
                            auth.password = value;
                          },
                          validator: (value) {
                            if (value.length < 3) {
                              return '❌ ' + 'Veuillez entrer un code valide'.tr;
                            }
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(45),
                        ),
                        // --------------------------------button --------------------

                        auth.isLoading
                            ? Loddingbutton(
                                loddinColor: Theme.of(context).backgroundColor,
                                height: 50,
                              )
                            : Defaultbutton(
                                onTap: () {
                                  _formKey.currentState!.save();

                                  if (_formKey.currentState!.validate()) {
                                    auth.signIn();
                                  }
                                },
                                color: primaryColor,
                                textcolor: Colors.white,
                                text: "Se connecter".tr,
                                haveIcon: true,
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: !auth.isLoading,
                          child: Defaultbutton(
                            onTap: () {
                              Get.to(RegisterView());
                            },
                            haveBorder: true,
                            textcolor: primaryColor,
                            text: "S’inscrire".tr,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: !auth.isLoading,
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Get.off(() => ControlView());
                              },
                              child: Text(
                                'Ingorer'.tr,
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // --------------------------------lang --------------------

                        GetBuilder<LangController>(
                          init: LangController(),
                          builder: (langauth) {
                            return Center(
                              child: DropdownButton<String>(
                                  isDense: true,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  value: langauth.lang,
                                  onChanged: (value) {
                                    langauth.changeLang(value ?? 'fr');
                                  },
                                  underline: Container(
                                    color: Colors.white,
                                  ),
                                  items: const [
                                    DropdownMenuItem<String>(
                                      value: 'fr',
                                      child: Text(
                                        'Francais',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem<String>(
                                        value: 'ar',
                                        child: Text(
                                          'العربية',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        )),
                                    DropdownMenuItem<String>(
                                      value: 'en',
                                      child: Text(
                                        'English',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ]),
                            );
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
