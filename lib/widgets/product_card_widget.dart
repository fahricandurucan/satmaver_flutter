import 'package:flutter/material.dart';
import 'package:satmaver_flutter/models/product.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: 130,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                ),
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
    );
  }
}
