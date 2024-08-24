import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_usecase.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUsecase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUsecase;

  int currentPage = 0;

  List<BookEntity> allBooks = [];

  Future<void> fetchNewestBooks({int page = 0}) async {
    currentPage = page;
    if (page == 0) {
      emit(NewestBooksInitial());
    }
    var result = await fetchNewestBooksUsecase.call(page);
    result.fold(
      (failure) {
        emit(NewestBooksFailure(errMessage: failure.message));
      },
      (books) {
        allBooks.addAll(books);
        emit(NewestBooksSuccess(books: allBooks));
      },
    );
  }

  Future<void> loadMoreBooks() async {
    if (currentPage < 11) {
      await fetchNewestBooks(page: currentPage + 1);
    }
  }
}
