import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/search/domain/usecases/fetch_searched_books_usecase.dart';
import 'package:meta/meta.dart';

part 'search_cubit_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.fetchSearchedBooksUseCase)
      : super(SearchBooksInitial());

  final FetchSearchedBooksUseCase fetchSearchedBooksUseCase;
  Future<void> fetchSearchedBooks({required String searchText}) async {
    emit(SearchBooksLoading());
    var result = await fetchSearchedBooksUseCase.call(searchText);
    result.fold((failure) {
      emit(SearchBooksFailure(errMessage: failure.message));
    }, (books) {
      emit(SearchBooksSuccess(books: books));
    });
  }
}
