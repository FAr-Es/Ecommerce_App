import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/data/models/cart_item.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/presentation/cubit/cart/cart_cubit.dart';
import 'package:ecommerce_app/presentation/cubit/home/home_cubit.dart';
import 'package:ecommerce_app/presentation/widgets/custom_button.dart';
import 'package:ecommerce_app/presentation/widgets/size_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.cubit,
    required this.cartCubit,
  });
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
  final ProductModel product;
  final HomeCubit cubit;
  final CartCubit cartCubit;
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final product = state.products.firstWhere(
            (p) => p.id == widget.product.id,
          );
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 47,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      Text("Details", style: AppTextStyles.h3),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset("assets/icons/bell.png"),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: Center(
                              child: SizedBox(
                                height: 368,
                                child: Image.network(product.imageUrl),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                widget.cubit.toggleFavorite(product.id);
                              },
                              child: Image.asset(
                                product.isFavorite
                                    ? "assets/icons/heart_filled.png"
                                    : "assets/icons/heart_outline.png",
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(product.title, style: AppTextStyles.h3),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Image.asset("assets/icons/star.png"),
                      Text(
                        "  ${product.rating}/5 ",
                        style: AppTextStyles.bodyRegularBoldBlack,
                      ),
                      Text(
                        "${product.reviewCount}",
                        style: AppTextStyles.bodyMediumGrey,
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    product.description,
                    style: AppTextStyles.bodyRegularGrey,
                  ),
                  SizedBox(height: 12),
                  Text("Choose size", style: AppTextStyles.h4),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      SizeCard(
                        size: "S",
                        isSelected: selectedSize == "S",
                        onTap: () {
                          setState(() {
                            selectedSize = "S";
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      SizeCard(
                        size: "M",
                        isSelected: selectedSize == "M",
                        onTap: () {
                          setState(() {
                            selectedSize = "M";
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      SizeCard(
                        size: "L",
                        isSelected: selectedSize == "L",
                        onTap: () {
                          setState(() {
                            selectedSize = "L";
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      SizeCard(
                        size: "XL",
                        isSelected: selectedSize == "XL",
                        onTap: () {
                          setState(() {
                            selectedSize = "XL";
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: 100,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price", style: AppTextStyles.bodyRegularGrey),
                        Text(
                          "\$ ${product.discountedPrice.toInt()}",
                          style: AppTextStyles.price,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 240,
                      child: CustomButton(
                        widget: Image.asset("assets/icons/bag.png"),
                        text: "Add to cart",
                        height: 54,
                        onTap: () {
                          if (selectedSize == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please select a size")),
                            );
                            return;
                          }
                          widget.cartCubit.addToCart(
                            CartItem(
                              product: product,
                              size: selectedSize!,
                              quantity: 1,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Product added to cart")),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
