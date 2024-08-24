import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:flutter/material.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fetchFeaturedBooks({int page = 0});
  Future<List<BookEntity>> fetchNewestBooks({int page = 0});
}

class HomeRemoteDataSourcesImpl extends HomeRemoteDataSources {
  final ApiService apiService;

  HomeRemoteDataSourcesImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int page = 0}) async {
    var data = await apiService.getApi(
        endPoint:
            "volumes?Filtering=free-ebooks&q=programming&startIndex=${(page * 10) + 1}");

    List<BookEntity> books = getBooksList(data);
    debugPrint(
        '-- fetchFeaturedBooks : the api has fetched the data of page number $page');
    // cacheBooksData(books, kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int page = 0}) async {
    var data = await apiService.getApi(
        endPoint:
            "volumes?Filtering=free-ebooks&q=computer science&startIndex=${(page * 10) + 1}");

    List<BookEntity> books = getBooksList(data);
    debugPrint(
        '-- fetchNewestBooks :  the api has fetched the data of page number $page');

    //cacheBooksData(books, kNewestBox);

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
