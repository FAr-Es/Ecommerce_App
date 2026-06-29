import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/presentation/cubit/cart/cart_cubit.dart';
import 'package:ecommerce_app/presentation/cubit/home/home_cubit.dart';
import 'package:ecommerce_app/presentation/screens/home/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.cardHeight, required this.imageHeight});

  final ProductModel product;
  final double cardHeight;
  final double imageHeight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cubit = context.read<HomeCubit>();
        final CartCubit cartCubit = context.read<CartCubit>();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              product: product,
              cubit: cubit,
              cartCubit: cartCubit,

            ),
          ),
        );
      },
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.imageUrl,
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      context.read<HomeCubit>().toggleFavorite(product.id);
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
            SizedBox(height: 8),
            Text(product.title, style: AppTextStyles.bodyRegularBoldBlack),
            Row(
              children: [
                Text(
                  "\$ ${product.discountedPrice.toInt()}",
                  style: AppTextStyles.bodySmallBold,
                ),
                SizedBox(width: 5),
                if (product.discountPercent != null)
                  Text(
                    "- ${product.discountPercent!.toInt()}%",
                    style: AppTextStyles.errorText,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
