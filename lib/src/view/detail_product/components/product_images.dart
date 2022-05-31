import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/view/detail_product/details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: ImageNetwork(
              image: widget.product.images[selectedImage],
              imageCache: CachedNetworkImageProvider(
                  widget.product.images[selectedImage]),
              onError: const Icon(
                Icons.error,
                color: Colors.grey,
              ),
              width: 180,
              height: 180,
              curve: Curves.easeIn,
              onPointer: true,
              debugPrint: false,
              fullScreen: false,
              fitAndroidIos: BoxFit.contain,
              fitWeb: BoxFitWeb.contain,
              borderRadius: BorderRadius.circular(10),
              onLoading: const CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: primaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: ImageNetwork(
          image: widget.product.images[index],
          imageCache: CachedNetworkImageProvider(widget.product.images[index]),
          onError: const Icon(
            Icons.error,
            color: Colors.grey,
          ),
          width: 50,
          height: 50,
          curve: Curves.easeIn,
          onPointer: true,
          debugPrint: false,
          fullScreen: false,
          fitAndroidIos: BoxFit.contain,
          fitWeb: BoxFitWeb.contain,
          borderRadius: BorderRadius.circular(10),
          onLoading: const CircularProgressIndicator.adaptive(),
          onTap: () {
            setState(() {
              selectedImage = index;
            });
          },
        ),
        // CachedNetworkImage(
        //   imageUrl: widget.product.images[index],
        //   progressIndicatorBuilder: (context, url, downloadProgress) =>
        //       CircularProgressIndicator(value: downloadProgress.progress),
        //   errorWidget: (context, url, error) => Icon(Icons.error),
        // ),
      ),
    );
  }
}
