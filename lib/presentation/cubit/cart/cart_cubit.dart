import 'package:ecommerce_app/data/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cartItems: []));
  void addToCart(CartItem item) {
    if (state.cartItems.any((cartItem) =>
        cartItem.product.id == item.product.id &&
        cartItem.size == item.size)) {
      // If the item with the same product and size already exists, increase its quantity
      List<CartItem> updatedCartItems = state.cartItems.map((cartItem) {
        if (cartItem.product.id == item.product.id &&
            cartItem.size == item.size) {
          return cartItem.copyWith(quantity: cartItem.quantity + item.quantity);
        }
        return cartItem;
      }).toList();
      emit(CartState(cartItems: updatedCartItems));
      return;
    }
    List<CartItem> updatedCartItems = List.from(state.cartItems);
    updatedCartItems.add(item);
    emit(CartState(cartItems: updatedCartItems));
  }

  void removeFromCart(CartItem item) {
    List<CartItem> updatedCartItems = List.from(state.cartItems);
    updatedCartItems.remove(item);
    emit(CartState(cartItems: updatedCartItems,));
  }

  void increaseQuantity(CartItem item) {
    List<CartItem> updatedCartItems = state.cartItems.map((cartItem) {
      if (cartItem == item) {
        return cartItem.copyWith(quantity: cartItem.quantity + 1);
      }
      return cartItem;
    }).toList();
    emit(CartState(cartItems: updatedCartItems));
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity == 1){
      removeFromCart(item);
      return;
    }
    List<CartItem> updatedCartItems = state.cartItems.map((cartItem) {
      if (cartItem == item && cartItem.quantity > 1) {
        return cartItem.copyWith(quantity: cartItem.quantity - 1);
      }
      return cartItem;
    }).toList();
    emit(CartState(cartItems: updatedCartItems));
  }
}
