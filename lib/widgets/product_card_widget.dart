import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/controllers/home_page_controllers.dart';
import 'package:satmaver_flutter/models/product.dart';
import 'package:satmaver_flutter/screens/product_detail_page.dart';

class ProductCardWidget extends GetView<HomePageControllers> {
  final Product product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
          child: GestureDetector(
            onTap: () {
              Get.to(ProductDetailPage(
                product: product,
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: SizedBox(
                            height: 160,
                            width: 150,
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: AnimatedCrossFade(
                                firstChild: firstWidget(),
                                secondChild: secondWidget(),
                                crossFadeState: controller.favoriteIdList.contains(product.id)
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 500)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(product.name),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget firstWidget() {
    return Container(
        height: 35,
        width: 35,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.white),
        child: const Icon(Icons.favorite, color: Colors.red));
  }

  Widget secondWidget() {
    return Container(
        height: 35,
        width: 35,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.white),
        child: const Icon(
          Icons.favorite_border,
          color: Colors.grey,
        ));
  }
}
