class ProductModel {
  final String id;
  final String title;
  final String imageUrl;
  final double originalPrice;
  final double? discountPercent;
  final bool isFavorite;
  final String category;
  double get discountedPrice => discountPercent != null
      ? originalPrice * (1 - discountPercent! / 100)
      : originalPrice;
  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.originalPrice,
    this.discountPercent,
    this.isFavorite = false,
    required this.category,
  });

  ProductModel copyWith({
    String? id,
    String? title,
    String? imageUrl,
    double? originalPrice,
    double? discountPercent,
    bool? isFavorite,
    String? category,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      originalPrice: originalPrice ?? this.originalPrice,
      discountPercent: discountPercent ?? this.discountPercent,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
    );
  }
}
