import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satmaver_flutter/controllers/home_page_controllers.dart';

class SearchBarWidget extends GetView<HomePageControllers> {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: TextField(
        controller: controller.searchController,
        onChanged: (value) {
          value == "" ? controller.filteredList.clear() : null;
        },
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              if (controller.searchController.text.isNotEmpty) {
                controller.applyFilter(controller.searchController.text);
              } else {
                print("ara sokaktasın abe hayrannnn yavaş gel");
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100.withOpacity(.7),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          hintText: "Search",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
