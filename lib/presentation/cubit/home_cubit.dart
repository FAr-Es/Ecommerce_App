import 'package:ecommerce_app/data/models/fake_products.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(products: fakeProducts, selectedCategory: 'All'));

  void selectCategory(String category) {
    if (category == 'All') {
      emit(HomeState(products: fakeProducts, selectedCategory: 'All'));
      return;
    }
    List<ProductModel> products = fakeProducts
        .where((product) => product.category == category)
        .toList();
    emit(HomeState(products:products, selectedCategory: category));
  }

  void toggleFavorite(String productId) {
    List<ProductModel> updatedProducts = state.products.map((product) {
      if (product.id == productId) {
        return product.copyWith(isFavorite: !product.isFavorite);
      }
      return product;
    }).toList();
    emit(HomeState(products:updatedProducts, selectedCategory: state.selectedCategory));
    }
}
