import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_similar_books_usecase.dart';
import 'package:meta/meta.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUsecase)
      : super(SimilarBooksInitial());
  final FetchSimilarBooksUsecase fetchSimilarBooksUsecase;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var data = await fetchSimilarBooksUsecase.call(category);

    data.fold((failure) {
      emit(SimilarBooksFailure(errMessage: failure.message));
    }, (books) {
      emit(SimilarBooksSuccess(books: books));
    });
  }
}
