import 'package:ecommerce_app/data/models/product_model.dart';

final List<ProductModel> fakeProducts = [
  ProductModel(
    id: '1',
    title: 'Regular Fit Slogan',
    imageUrl: 'https://picsum.photos/id/1/200',
    originalPrice: 1190,
    category: 'Tshirts',
  ),
  ProductModel(
    id: '2',
    title: 'Regular Fit Polo',
    imageUrl: 'https://picsum.photos/id/2/200',
    originalPrice: 2291,
    discountPercent: 52,
    category: 'Tshirts',
  ),
  ProductModel(
    id: '3',
    title: 'Regular Fit Black',
    imageUrl: 'https://picsum.photos/id/3/200',
    originalPrice: 1690,
    category: 'Tshirts',
  ),
  ProductModel(
    id: '4',
    title: 'Slim Fit Jeans',
    imageUrl: 'https://picsum.photos/id/4/200',
    originalPrice: 2500,
    discountPercent: 20,
    category: 'Jeans',
  ),
  ProductModel(
    id: '5',
    title: 'Straight Cut Jeans',
    imageUrl: 'https://picsum.photos/id/5/200',
    originalPrice: 1800,
    category: 'Jeans',
  ),
  ProductModel(
    id: '6',
    title: 'Running Shoes',
    imageUrl: 'https://picsum.photos/id/6/200',
    originalPrice: 3200,
    discountPercent: 15,
    category: 'Shoes',
  ),
  ProductModel(
    id: '7',
    title: 'Casual Sneakers',
    imageUrl: 'https://picsum.photos/id/7/200',
    originalPrice: 2800,
    category: 'Shoes',
  ),
];