import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class ReadingState {}

class ReadingInitial extends ReadingState {}

class ReadingLoading extends ReadingState {}

class ReadingSuccess extends ReadingState {
  final List<BookEntity> books;
  ReadingSuccess(this.books);
}

class ReadingFailure extends ReadingState {
  final String errMessage;
  ReadingFailure(this.errMessage);
}

class BookAddedToReading extends ReadingState {}
class BookRemovedFromReading extends ReadingState {}
