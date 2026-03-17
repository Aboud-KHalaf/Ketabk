import 'package:bookly/Features/home/data/data_sources/reading_local_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/reading_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class ReadingRepoImpl extends ReadingRepo {
  final ReadingLocalDataSource readingLocalDataSource;

  ReadingRepoImpl(this.readingLocalDataSource);

  @override
  Future<Either<Failure, void>> addBookToReading(BookEntity book) async {
    try {
      await readingLocalDataSource.addBook(book);
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeBookFromReading(BookEntity book) async {
    try {
      await readingLocalDataSource.removeBook(book);
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchReadingList() async {
    try {
      var books = readingLocalDataSource.fetchReadingList();
      return right(books);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
