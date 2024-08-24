import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_usecase.dart';
import 'package:meta/meta.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featuredBooksUseCase) : super(FeaturedBookInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  int currentPage = 0, pageNumber = 0;
  List<BookEntity> allBooks = [];

  Future<void> fetchFeaturedBooks({int page = 0}) async {
    if (page == 0) emit(FeaturedBookLoading());
    var result = await featuredBooksUseCase.call(page);
    result.fold(
      (failure) {
        emit(FeaturedBookFailure(errMessage: failure.message));
      },
      (books) {
        currentPage = page;
        allBooks.addAll(books);
        emit(FeaturedBookSuccess(books: allBooks));
      },
    );
  }

  Future<void> loadMoreBooks() async {
    if (currentPage < 11) {
      await fetchFeaturedBooks(page: currentPage + 1);
    }
  }
}
