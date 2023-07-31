import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/controllers/home_page_controllers.dart';
import 'package:satmaver_flutter/models/product.dart';

class ProductDetailPage extends GetView<HomePageControllers> {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail Page"),
      ),
      body: Obx(
        () => Column(
          children: [
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.pink.shade100.withOpacity(.7),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Muğla/Menteşe"),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(product.name),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Acele Et, Kaçırma",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            controller.productStatus.value == ProductStatus.none
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade100.withOpacity(.7)),
                    onPressed: () {
                      product.status = ProductStatus.rezerve;
                      controller.productStatus.value = product.status;
                    },
                    child: const Text(
                      "Rezerve Et",
                      style: TextStyle(color: Colors.red),
                    ))
                : const SizedBox(),
            const SizedBox(
              height: 10,
            ),
            controller.productStatus.value == ProductStatus.rezerve
                ? Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.pink.shade100.withOpacity(.7),
                          borderRadius: const BorderRadius.all(Radius.circular(15))),
                      child: Center(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Alıcı Bilgileri",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Ad:", style: TextStyle(fontSize: 16)),
                                    Text("Soyad:", style: TextStyle(fontSize: 16)),
                                    Text("Kullanıcı Adı:", style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fahrican"),
                                    Text("Durucan"),
                                    Text("fahrican"),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(onPressed: () {}, child: const Text("Kaydet")),
                                ElevatedButton(
                                    onPressed: () {
                                      product.status = ProductStatus.none;
                                      controller.productStatus.value = product.status;
                                    },
                                    child: const Text("İptal Et")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
