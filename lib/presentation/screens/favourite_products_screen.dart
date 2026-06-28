import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_app/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteProductsScreen extends StatelessWidget {
  const FavouriteProductsScreen({super.key});

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
                  Text("Saved Items", style: AppTextStyles.h3),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("assets/icons/bell.png"),
                  ),
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final favourites = state.products
                      .where((p) => p.isFavorite)
                      .toList();
                  if (favourites.isEmpty) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/empty_favourites.png",
                          ),
                          SizedBox(height: 12),
                          Text(
                            "No saved items!",
                            style: AppTextStyles.bodyRegularBoldBlack,
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 69.0),
                            child: Text("You don’t have any saved items. Go to home and add some.", 
                              style: AppTextStyles.bodyRegularGrey,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.97,
                    ),
                    shrinkWrap: true,
                    itemCount: favourites.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: favourites[index],
                        cardHeight: 172,
                        imageHeight: 122,
                      );
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
