import 'package:ecommerce_app/core/themes/app_text_style.dart';
import 'package:ecommerce_app/core/themes/app_theme.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/presentation/widgets/custom_button.dart';
import 'package:ecommerce_app/presentation/widgets/size_card.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
  final ProductModel product;
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 47),

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

            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Center(
                child: SizedBox(
                  height: 368,
                  child: Image.network(widget.product.imageUrl),
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(widget.product.title, style: AppTextStyles.h3),
            SizedBox(height: 12),
            Row(
              children: [
                Image.asset("assets/icons/star.png"),
                Text(
                  "  ${widget.product.rating}/5 ",
                  style: AppTextStyles.bodyRegularBoldBlack,
                ),
                Text(
                  "${widget.product.reviewCount}",
                  style: AppTextStyles.bodyMediumGrey,
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              widget.product.description,
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
                    "\$ ${widget.product.discountedPrice.toInt()}",
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
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
