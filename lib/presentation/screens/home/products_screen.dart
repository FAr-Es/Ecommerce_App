import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/presentation/cubit/home/home_cubit.dart';
import 'package:ecommerce_app/presentation/widgets/category_cards.dart';
import 'package:ecommerce_app/presentation/widgets/custom_textfield.dart';
import 'package:ecommerce_app/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discover", style: AppTextStyles.h2),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset("assets/icons/bell.png"),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: "Search for clothes...",
                          prefixIcon: Image.asset("assets/icons/search.png"),
                          suffixIcon: Image.asset("assets/icons/mic.png"),
                        ),
                      ),
                      SizedBox(width: 8),
                      Image.asset("assets/icons/filter.png"),
                    ],
                  ),
                  SizedBox(height: 16),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CategoryCards(
                              text: 'All',
                              isSelected: state.selectedCategory == 'All',
                            ),
                            SizedBox(width: 8),
                            CategoryCards(
                              text: 'Tshirts',
                              isSelected: state.selectedCategory == 'Tshirts',
                            ),
                            SizedBox(width: 8),
                            CategoryCards(
                              text: 'Jeans',
                              isSelected: state.selectedCategory == 'Jeans',
                            ),
                            SizedBox(width: 8),
                            CategoryCards(
                              text: 'Shoes',
                              isSelected: state.selectedCategory == 'Shoes',
                            ),
                            SizedBox(width: 8),
                            CategoryCards(
                              text: 'Jackets',
                              isSelected: state.selectedCategory == 'Jackets',
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.75,
                        ),
                        shrinkWrap: true,
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return ProductCard(product: product, cardHeight: 224, imageHeight: 172,);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
          }
}