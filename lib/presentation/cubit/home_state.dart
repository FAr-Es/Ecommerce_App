part of 'home_cubit.dart';

@immutable
class HomeState {
  final List<ProductModel> products;
  final String selectedCategory;

  const HomeState({
    required this.products,
    required this.selectedCategory,
  });
}
