import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/models/product.dart';

class HomePageControllers extends GetxController {
  final isSearch = false.obs;
  Rx<ProductStatus> productStatus = ProductStatus.none.obs;

  var searchText = "".obs;

  final filteredList = <Product>[].obs;

  var searchController = TextEditingController();

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
  ];
}
