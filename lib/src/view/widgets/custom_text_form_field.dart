import 'package:boutiqnet/src/constance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;

  final String? hint;

  final String prefix;

  final Function? onSave;
  final Function? validator;
  final TextInputType? keyboardtype;

  CustomTextFormField(
      {this.text,
      this.hint,
      this.onSave,
      this.validator,
      this.keyboardtype,
      required this.prefix});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          onSaved: onSave as void Function(String?)?,
          validator: validator as String? Function(String?)?,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIconConstraints: BoxConstraints(),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset(
                prefix,
                color: Colors.grey,
                height: 18,
              ),
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.black26,
              fontSize: 14,
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            hoverColor: primaryColor,
            focusColor: primaryColor,
            prefixIconColor: primaryColor,
            // filled: true,
          ),
        )
      ],
    );
  }
}
