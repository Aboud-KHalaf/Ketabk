import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/api_services.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourcesImpl extends HomeRemoteDataSources {
  final ApiService apiService;

  HomeRemoteDataSourcesImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.getApi(
        endPoint: "volumes?Filtering=free-ebooks&q=programming");

    List<BookEntity> books = getBooksList(data);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.getApi(
        endPoint: "volumes?Filtering=free-ebooks&q=computer science");

    List<BookEntity> books = getBooksList(data);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
