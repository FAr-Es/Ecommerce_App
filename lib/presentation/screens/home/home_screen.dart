import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/cubit/cart/cart_cubit.dart';
import 'package:ecommerce_app/presentation/cubit/home/home_cubit.dart';
import 'package:ecommerce_app/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app/presentation/screens/favourite_products_screen.dart';
import 'package:ecommerce_app/presentation/screens/home/products_screen.dart';
import 'package:ecommerce_app/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: [
            ProductsScreen(),
            Center(child: Text("Search")),
            FavouriteProductsScreen(),
            CartScreen(),
            Center(child: Text("Account")),
          ],
        ),
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: CustomBottomNavigationBar(
          onTap: (index) => setState(() {
            selectedIndex = index;
          }),
          currentIndex: selectedIndex,
        ),
      ),
    );
  }
}
