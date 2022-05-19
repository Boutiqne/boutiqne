import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoddingCategory extends StatelessWidget {
  const LoddingCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade200,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          height: getProportionateScreenHeight(100),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: getProportionateScreenHeight(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 5),
                    Spacer(),
                    Container(
                      height: getProportionateScreenHeight(20),
                      width: getProportionateScreenWidth(50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
