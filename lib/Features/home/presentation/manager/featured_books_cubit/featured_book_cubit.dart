import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_usecase.dart';
import 'package:meta/meta.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featuredBooksUseCase) : super(FeaturedBookInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());

    var resulte = await featuredBooksUseCase.call();
    resulte.fold(
      (failure) {
        emit(FeaturedBookFailure(errMessage: failure.message));
      },
      (books) {
        emit(FeaturedBookSuccess(books: books));
      },
    );
  }
}
