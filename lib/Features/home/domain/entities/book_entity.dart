import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String titlel;
  @HiveField(3)
  final String? atutherName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final String rating;
  @HiveField(6)
  final List<String>? categories;

  BookEntity({
    required this.categories,
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
