import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_app/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
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
                          return ProductCard(product: product);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.imageUrl,
              height: 174,
            ),
          ),
          SizedBox(height: 8,),
          Text(product.title, style: AppTextStyles.bodyRegularBoldBlack,),
          Row(
            children: [
              Text("\$ ${product.discountedPrice.toInt()}", style: AppTextStyles.bodySmallBold,),
              SizedBox(width: 5,),
              if(product.discountPercent != null)
              Text("- ${product.discountPercent!.toInt()}%", style: AppTextStyles.errorText,),
            ],
          )
        ],
      ),
    );
  }
}

class CategoryCards extends StatelessWidget {
  const CategoryCards({
    super.key,
    required this.text,
    required this.isSelected,
  });
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeCubit>().selectCategory(text);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
          child: Text(
            text,
            style: isSelected
                ? AppTextStyles.buttonLarge
                : AppTextStyles.bodyRegularSemiBoldBlack,
          ),
        ),
      ),
    );
  }
}
