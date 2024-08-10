class BookEntity {
  final String bookId;
  final String? image;
  final String titlel;
  final String? atutherName;
  final num? price;
  final String rating;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.titlel,
    required this.atutherName,
    required this.price,
    required this.rating,
  });
}

// notes :
// 1- "num" uses for double and integer numbers.
