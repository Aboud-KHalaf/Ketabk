import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSources {
  List<BookEntity> fetchFeaturedBooks();

  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourcesImpl extends HomeRemoteDataSources {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
