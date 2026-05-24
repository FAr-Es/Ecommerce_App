import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/presentation/cubit/home_cubit.dart';
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
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: [
            ProductsScreen(),
            Center(child: Text("Search")),
            Center(child: Text("Saved")),
            Center(child: Text("Cart")),
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
