class CartItem {
  final String title;
  final num price;
  final int quantity;
  final String weight;
  final String imageUrl;

  CartItem({
    required this.title,
    required this.price,
    required this.quantity,
    required this.weight,
    required this.imageUrl,
  });

  // Convert a Map to a CartItem
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      weight: json['weight'],
      imageUrl: json['imageUrl'],
    );
  }

  // Convert a CartItem to a Map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'quantity': quantity,
      'weight': weight,
      'imageUrl': imageUrl,
    };
  }
}
