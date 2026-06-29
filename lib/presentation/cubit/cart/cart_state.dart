part of 'cart_cubit.dart';

@immutable
class CartState {
  final List<CartItem> cartItems;
  const CartState({
    required this.cartItems,
  });
}
