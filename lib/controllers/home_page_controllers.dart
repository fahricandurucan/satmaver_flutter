import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:satmaver_flutter/models/product.dart';

class HomePageControllers extends GetxController {
  final Box<Product> productBox = Hive.box<Product>("myBox2");

  final isSearch = false.obs;
  final isLike = false.obs;

  Rx<ProductStatus> productStatus = ProductStatus.none.obs;

  var searchText = "".obs;

  final filteredList = <Product>[].obs;
  final favoriteList = <Product>[].obs;
  final favoriteIdList = <int>[].obs;

  var searchController = TextEditingController();

  void deleteAll() {
    for (var x in productBox.keys) {
      productBox.delete(x);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    try {
      for (final product in productBox.values) {
        print("id = ${product.id} - name = ${product.name}");
        favoriteList.add(product);
        favoriteIdList.add(product.id);
      }
    } catch (e) {
      print(e);
    }
    super.onInit();
  }

  void addFavoriteList(Product product) {
    productBox.add(product);
    favoriteList.add(product);
    favoriteIdList.add(product.id);
  }

  void deleteFavoriteList(Product product) {
    for (final key in productBox.keys) {
      if (productBox.get(key) == product) {
        productBox.delete(key);
      }
    }
    favoriteList.remove(product);
    favoriteIdList.remove(product.id);
  }

  void applyFilter(String text) {
    for (final x in list) {
      if (x.name.toLowerCase().contains(text.toLowerCase())) {
        filteredList.add(x);
      }
    }
  }

  final list = [
    Product(
        id: 1,
        name: "Telefon",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeOElcrHiDcyC20XsZj9qNgoSN-CZUfwAh8Q&usqp=CAU",
        status: ProductStatus.none),
    Product(
        id: 2,
        name: "Masa",
        image: "https://cdn.evkur.com.tr/c/Product/thumbs/z2_tj7m4d_500.jpg",
        status: ProductStatus.none),
    Product(
        id: 3,
        name: "Kitap",
        image: "https://s3.cloud.ngn.com.tr/kitantik/images/2019-12-18/0z8kgltk4axcczu18li.jpeg",
        status: ProductStatus.none),
    Product(
        id: 4,
        name: "Tişört",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5wPeWBkXrhi1rTmNr3r7sSO36yduepqt0MQ&usqp=CAU",
        status: ProductStatus.none),
    Product(
        id: 5,
        name: "Telefon",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeOElcrHiDcyC20XsZj9qNgoSN-CZUfwAh8Q&usqp=CAU",
        status: ProductStatus.none),
    Product(
        id: 6,
        name: "Masa",
        image: "https://cdn.evkur.com.tr/c/Product/thumbs/z2_tj7m4d_500.jpg",
        status: ProductStatus.none),
    Product(
        id: 7,
        name: "Kitap",
        image: "https://s3.cloud.ngn.com.tr/kitantik/images/2019-12-18/0z8kgltk4axcczu18li.jpeg",
        status: ProductStatus.none),
    Product(
        id: 8,
        name: "Tişört",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5wPeWBkXrhi1rTmNr3r7sSO36yduepqt0MQ&usqp=CAU",
        status: ProductStatus.none),
    Product(
        id: 9,
        name: "Telefon",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeOElcrHiDcyC20XsZj9qNgoSN-CZUfwAh8Q&usqp=CAU",
        status: ProductStatus.none),
    Product(
        id: 10,
        name: "Masa",
        image: "https://cdn.evkur.com.tr/c/Product/thumbs/z2_tj7m4d_500.jpg",
        status: ProductStatus.none),
    Product(
        id: 11,
        name: "Kitap",
        image: "https://s3.cloud.ngn.com.tr/kitantik/images/2019-12-18/0z8kgltk4axcczu18li.jpeg",
        status: ProductStatus.none),
    Product(
        id: 12,
        name: "Tişört",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5wPeWBkXrhi1rTmNr3r7sSO36yduepqt0MQ&usqp=CAU",
        status: ProductStatus.none),
  ];
}
