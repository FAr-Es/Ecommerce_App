import 'package:ecommerce_app/data/models/product_model.dart';

class CartItem {
  final ProductModel product;
  final String size;
  final int quantity;
  CartItem({
    required this.size,
    required this.quantity,
    required this.product,
  });

  CartItem copyWith({
    ProductModel? product,
    String? size,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }
}