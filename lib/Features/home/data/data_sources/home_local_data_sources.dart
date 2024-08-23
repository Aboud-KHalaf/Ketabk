import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSources {
  List<BookEntity> fetchFeaturedBooks({page = 0});

  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourcesImpl extends HomeLocalDataSources {
  @override
  List<BookEntity> fetchFeaturedBooks({page = 0}) {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
