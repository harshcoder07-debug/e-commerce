class CartModel {
  final String id;
  final String name;
  final double price;
  final int quatity;

  CartModel({
    required this.id,
    required this.name,
    required this.price,
    this.quatity = 1,
  });
  CartModel copyWith({int? quantity}) {
    return CartModel(id: id, name: name, price: price, quatity: quantity ?? quatity);
  }
}
