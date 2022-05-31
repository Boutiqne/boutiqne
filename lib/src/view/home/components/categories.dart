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
            Get.to(() => const ViewAllCategory(title: "Top Categories"));
          },
        ),
        const SizedBox(height: (15)),
        SizedBox(
          height: (80),
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
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: (10)),
            padding: const EdgeInsets.all((15)),
            width: (55),
            height: 55,
            decoration: BoxDecoration(
              color: kPrimaryLightColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              categoryModel.image ?? '',
              color: primaryColor,
            ),
          ),
          const SizedBox(height: (5)),
          Text(categoryModel.name ?? '',
              style: const TextStyle(
                fontSize: (11),
              ),
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
