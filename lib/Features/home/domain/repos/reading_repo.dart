import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ReadingRepo {
  Future<Either<Failure, void>> addBookToReading(BookEntity book);
  Future<Either<Failure, void>> removeBookFromReading(BookEntity book);
  Future<Either<Failure, List<BookEntity>>> fetchReadingList();
}
