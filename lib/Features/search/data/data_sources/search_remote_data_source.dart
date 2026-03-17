import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/core/utils/functions/get_books_list.dart';
import 'package:flutter/material.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearedBooks({
    required String searchText,
    String? orderBy,
  });
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchSearedBooks({
    required String searchText,
    String? orderBy,
  }) async {
    String url = 'volumes?q=subject:$searchText';
    if (orderBy != null) {
      url += '&orderBy=$orderBy';
    } else {
      url += '&Filtering=relevance'; // Default filtering if not specified
    }

    var data = await apiService.getApi(endPoint: url);
    List<BookEntity> books = getBooksList(data);

    debugPrint(
        '-- fetchSearedBooks :  the api has fetched the data of searchText : ( $searchText ) with orderBy: $orderBy');

    return books;
  }
}
