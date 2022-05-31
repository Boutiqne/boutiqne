import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/helper/string_tocolor.dart';

import 'package:flutter/material.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({Key? key, required this.colors, required this.onChangeColor})
      : super(key: key);

  final List<dynamic> colors;
  final Function(String) onChangeColor;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  // Now this is fixed and only for demo
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          const Text(
            'Colors',
          ),
          const Spacer(),
          ...List.generate(widget.colors.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedColor = index;
                });
                widget.onChangeColor(widget.colors[index]);
              },
              child: ColorDot(
                color: widget.colors[index].toString().toColor(),
                isSelected: index == selectedColor,
              ),
            );
          }),
          // Spacer(),
          // RoundedIconBtn(
          //   icon: Icons.remove,
          //   press: () {},
          // ),
          // SizedBox(width: getProportionateScreenWidth(20)),
          // RoundedIconBtn(
          //   icon: Icons.add,
          //   showShadow: true,
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(35),
      width: getProportionateScreenWidth(35),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? primaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
