class Product {
  int id;
  String name;
  double price;
  String image;
  String description;
  int quantity = 1;
  bool isfav; // Keeps track of favorite status

  Product({
    required this.isfav, 
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.quantity,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? 0,
        name = json["name"] ?? "",
        price = (json["price"] as num?)?.toDouble() ?? 0.0,
        image = json["image"] ?? "",
        description = json["description"] ?? "",
        quantity = (json["quantity"] as num?)?.toInt() ?? 1,
        isfav = json["isfav"] ?? false; 
}
