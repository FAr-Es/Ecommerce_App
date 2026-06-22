class ProductModel {
  final String id;
  final String title;
  final String imageUrl;
  final double originalPrice;
  final double? discountPercent;
  final bool isFavorite;
  final String category;
  final String description;
  final int reviewCount;
  final double rating;
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
    required this.description,
    required this.reviewCount,
    required this.rating,
  });

  ProductModel copyWith({
    String? id,
    String? title,
    String? imageUrl,
    double? originalPrice,
    double? discountPercent,
    bool? isFavorite,
    String? category,
    String? description,
    int? reviewCount,
    double? rating,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      originalPrice: originalPrice ?? this.originalPrice,
      discountPercent: discountPercent ?? this.discountPercent,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
      description: description ?? this.description,
      reviewCount: reviewCount ?? this.reviewCount,
      rating: rating ?? this.rating,
    );
  }
}
