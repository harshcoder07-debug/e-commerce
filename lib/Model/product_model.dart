class Product {
  int id;
  String name;
  double price;
  String image;
  String description;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
  Product.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      name = json['name'],
      image = json["Image"],
      price = json["price"],
      description = json['Description'];
}
