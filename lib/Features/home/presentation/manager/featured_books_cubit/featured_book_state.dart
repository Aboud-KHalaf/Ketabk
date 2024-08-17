part of 'featured_book_cubit.dart';

@immutable
abstract class FeaturedBookState {}

class FeaturedBookInitial extends FeaturedBookState {}

class FeaturedBookLoading extends FeaturedBookState {}

class FeaturedBookFailure extends FeaturedBookState {
  final String errMessage;

  FeaturedBookFailure({required this.errMessage});
}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookEntity> books;

  FeaturedBookSuccess({required this.books});
}
