import 'package:hive_flutter/hive_flutter.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String image;
  @HiveField(3)
  ProductStatus status;

  Product({required this.id, required this.name, required this.image, required this.status});
}

@HiveType(typeId: 2)
enum ProductStatus {
  @HiveField(0)
  none,
  @HiveField(1)
  rezerve,
  @HiveField(2)
  sold
}
