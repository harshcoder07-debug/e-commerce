class Product {
  int id;
  String name;
  double price;
  String image;
  String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  Product.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      name = json["name"],
      price = (json["price"] as num).toDouble(),
      image = json["image"],
      description = json["description"];
}
