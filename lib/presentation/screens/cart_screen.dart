import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/cubit/cart/cart_cubit.dart';
import 'package:ecommerce_app/presentation/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 47),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Cart", style: AppTextStyles.h2),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("assets/icons/bell.png"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if(state.cartItems.isEmpty){
                    return  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/empty_cart.png",
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Your Cart Is Empty!",
                            style: AppTextStyles.bodyRegularBoldBlack,
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 69.0),
                            child: Text("When you add products, they’ll appear here.", 
                              style: AppTextStyles.bodyRegularGrey,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = state.cartItems[index];
                      return CartCard(cartItem: cartItem);
                    },
                  );
                },
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
