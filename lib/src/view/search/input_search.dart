import 'package:boutiqnet/src/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInputFb2 extends StatelessWidget {
  final String hintText;
  Function(String)? onChanged;
  SearchInputFb2({required this.hintText, this.onChanged, Key? key})
      : super(
          key: key,
        );

  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      autofocus: true,
      // style: TextStyle(fontSize: 14, color: accentColor),
      decoration: InputDecoration(
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SvgPicture.asset(
            'assets/icons/Iconly-Curved-Search.svg',
            color: Colors.grey,
            height: 15,
            width: 15,
          ),
        ),
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }
}
