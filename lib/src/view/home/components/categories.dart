import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/model/category_model.dart';
import 'package:boutiqnet/src/view/category/category.dart';
import 'package:boutiqnet/src/view/home/components/section_title.dart';
import 'package:boutiqnet/src/view/view_all/all_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Top Categories".tr,
          press: () {
            Get.to(() => ViewAllCategory(title: "Top Categories"));
          },
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SizedBox(
          height: getProportionateScreenHeight(80),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => CategoryCard(
              categoryModel: categories[index],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductsByCategory(
            category: categoryModel,
          ),
        );
      },
      child: SizedBox(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: kPrimaryLightColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                categoryModel.image ?? '',
                color: primaryColor,
              ),
            ),
            SizedBox(height: 5),
            Text(categoryModel.name ?? '',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(11),
                ),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
