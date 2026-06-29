import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/data/models/cart_item.dart';
import 'package:ecommerce_app/presentation/cubit/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.cartItem});
  final CartItem cartItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:14.0),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                cartItem.product.imageUrl,
                width: 83,
                height: 79,
                fit: BoxFit.cover,
              ),
            ),
      
            const SizedBox(width: 14),
      
            Expanded(
              child: SizedBox(
                height: 79,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            cartItem.product.title,
                            style: AppTextStyles.bodyRegularBoldBlack,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
      
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().removeFromCart(cartItem);
                          },
                          child: Image.asset(
                            "assets/icons/delete.png",
                            width: 20,
                          ),
                        ),
                      ],
                    ),
      
                    const SizedBox(height: 4),
      
                    Text(cartItem.size, style: AppTextStyles.bodyMediumGrey),
      
                    const Spacer(),
      
                    Row(
                      children: [
                        Text(
                          "\$${cartItem.product.discountedPrice}",
                          style: AppTextStyles.bodyRegularBoldBlack,
                        ),
      
                        const Spacer(),
      
                        GestureDetector(
                          onTap: () {
                            cartItem.quantity > 1
                                ? context.read<CartCubit>().decreaseQuantity(cartItem)
                                : context.read<CartCubit>().removeFromCart(cartItem);
                          },
                          child: Image.asset("assets/icons/minus.png", width: 28),
                        ),
      
                        const SizedBox(width: 10),
      
                        Text(cartItem.quantity.toString(), style: AppTextStyles.bodyRegularBoldBlack),
      
                        const SizedBox(width: 10),
      
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().increaseQuantity(cartItem);
                          },
                          child: Image.asset("assets/icons/plus.png", width: 28),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
