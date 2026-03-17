import 'dart:developer';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class ReadingLocalDataSource {
  Future<void> addBook(BookEntity book);
  Future<void> removeBook(BookEntity book);
  List<BookEntity> fetchReadingList();
}

class ReadingLocalDataSourceImpl extends ReadingLocalDataSource {
  @override
  Future<void> addBook(BookEntity book) async {
    log('Adding book to Hive: ${book.bookId} - ${book.titlel}');
    var box = Hive.box<BookEntity>(kReadingBox);
    
    // Explicitly create BookEntity to avoid issues with subclasses (like BookModel)
    // and ensure match with registered BookEntityAdapter runtimeType.
    final entityToSave = BookEntity(
      categories: book.categories,
      url: book.url,
      bookId: book.bookId,
      image: book.image,
      titlel: book.titlel,
      atutherName: book.atutherName,
      price: book.price,
      rating: book.rating,
    );
    
    await box.put(book.bookId, entityToSave);
    log('Book added. New box length: ${box.length}');
  }

  @override
  Future<void> removeBook(BookEntity book) async {
    log('Removing book from Hive: ${book.bookId}');
    var box = Hive.box<BookEntity>(kReadingBox);
    await box.delete(book.bookId);
    log('Book removed. New box length: ${box.length}');
  }

  @override
  List<BookEntity> fetchReadingList() {
    var box = Hive.box<BookEntity>(kReadingBox);
    log('Fetching reading list. Box length: ${box.length}');
    return box.values.toList();
  }
}
