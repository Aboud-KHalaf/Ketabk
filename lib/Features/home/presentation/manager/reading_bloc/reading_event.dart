import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class ReadingEvent {}

class AddBookToReadingEvent extends ReadingEvent {
  final BookEntity book;
  AddBookToReadingEvent(this.book);
}

class RemoveBookFromReadingEvent extends ReadingEvent {
  final BookEntity book;
  RemoveBookFromReadingEvent(this.book);
}

class FetchReadingListEvent extends ReadingEvent {}
