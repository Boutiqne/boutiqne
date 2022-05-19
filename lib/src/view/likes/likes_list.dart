import 'package:boutiqnet/src/core/service/firestore_likes.dart';
import 'package:boutiqnet/src/core/view_model/likes_view_model.dart';
import 'package:boutiqnet/src/view/home/components/special_offers.dart';
import 'package:boutiqnet/src/view/likes/like_lodding.dart';
import 'package:boutiqnet/src/view/notification/notification_lodding.dart';
import 'package:boutiqnet/src/view/likes/like_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikesList extends StatelessWidget {
  const LikesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'favories'.tr,
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<LikesViewModel>(
          init: LikesViewModel(),
          builder: (controller) {
            return (controller.likesProducts.isEmpty)
                ? LoddingLikes()
                : ListView.builder(
                    itemCount: controller.likesProducts.length,
                    itemBuilder: (context, index) {
                      return LikeProductCard(
                        product: controller.likesProducts[index],
                        index: index,
                      );
                    },
                  );
          }),
    );
  }
}
