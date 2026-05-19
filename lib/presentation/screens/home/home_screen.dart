import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_app/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryCards(text: 'All',),
                      SizedBox(width: 8,),
                      CategoryCards(text: 'Tshirts',),
                      SizedBox(width: 8,),
                      CategoryCards(text: 'Jeans',),
                      SizedBox(width: 8,),
                      CategoryCards(text: 'Shoes',),
                      SizedBox(width: 8,),
                      CategoryCards(text: 'Jackets',),
                      SizedBox(width: 8,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCards extends StatelessWidget {
  const CategoryCards({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 7.0,
          ),
          child: Text(
            text,
            style: AppTextStyles.bodyRegularSemiBoldBlack,
          ),
        ),
      ),
    );
  }
}
