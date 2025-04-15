import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/core/utils/functions/get_books_list.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/functions/cache_books_data.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fetchFeaturedBooks({int page = 0});
  Future<List<BookEntity>> fetchNewestBooks({int page = 0});
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
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

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int page = 0}) async {
    var data = await apiService.getApi(
        endPoint:
            "volumes?Filtering=free-ebooks&q=math&startIndex=${(page * 10) + 1}");

    List<BookEntity> books = getBooksList(data);
    debugPrint(
        '-- fetchNewestBooks :  the api has fetched the data of page number $page');

    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiService.getApi(
        endPoint: 'volumes?Filtering=relevance&q=subject:$category');
    List<BookEntity> books = getBooksList(data);

    debugPrint(
        '-- fetchSimilarBooks :  the api has fetched the data of category : ( $category )');

    return books;
  }
}
