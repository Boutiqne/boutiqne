import 'package:boutiqnet/src/constance.dart';
import 'package:flutter/material.dart';

class NumberProduct extends StatefulWidget {
  final String title;
  final int defaultValue;
  final Function(int) onChangeValue;

  const NumberProduct(
      {required this.title,
      required this.onChangeValue,
      this.defaultValue = 2,
      Key? key})
      : assert(defaultValue >= 0),
        super(key: key);

  @override
  State<NumberProduct> createState() => _NumberProductState();
}

class _NumberProductState extends State<NumberProduct> {
  late int _count;
  @override
  void initState() {
    super.initState();
    _count = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.title),
        const Spacer(),
        Text(_count.toString()),
        const SizedBox(
          width: 15,
        ),
        OutlinedButton(
          onPressed: () {
            setState(() {
              _count += 1;
            });
            widget.onChangeValue(_count);
          },
          child: const Icon(
            Icons.remove,
            size: 15,
            color: primaryColor,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        OutlinedButton(
          onPressed: () {
            if (_count > 0) {
              setState(() {
                _count += 1;
              });
              widget.onChangeValue(_count);
            }
          },
          child: const Icon(
            Icons.add,
            size: 15,
            color: primaryColor,
          ),
        )
      ],
    );
  }
}
