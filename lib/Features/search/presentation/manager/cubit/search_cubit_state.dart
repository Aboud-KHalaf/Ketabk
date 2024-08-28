part of 'search_cubit_cubit.dart';

@immutable
abstract class SearchBooksState {}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}

class SearchBooksFailure extends SearchBooksState {
  final String errMessage;

  SearchBooksFailure({required this.errMessage});
}

class SearchBooksSuccess extends SearchBooksState {
  final List<BookEntity> books;

  SearchBooksSuccess({required this.books});
}
