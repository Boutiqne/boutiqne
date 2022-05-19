import 'package:boutiqnet/src/core/view_model/home_view_model.dart';
import 'package:boutiqnet/src/view/widgets/custum_lodding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeViewModel>(
          init: HomeViewModel(),
          autoRemove: false,
          builder: (controller) {
            return (controller.products.isNotEmpty) ? Body() : CustomLodding();
          }),
    );
  }
}
