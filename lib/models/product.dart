class Product {
  int id;
  String name;
  String image;
  ProductStatus status;

  Product({required this.id, required this.name, required this.image, required this.status});
}

enum ProductStatus { none, rezerve, sold }
