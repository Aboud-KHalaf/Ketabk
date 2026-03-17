import 'dart:developer';
import 'package:bookly/Features/home/domain/use_cases/add_book_to_reading_usecase.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_reading_list_usecase.dart';
import 'package:bookly/Features/home/domain/use_cases/remove_book_from_reading_usecase.dart';
import 'package:bookly/Features/home/presentation/manager/reading_bloc/reading_event.dart';
import 'package:bookly/Features/home/presentation/manager/reading_bloc/reading_state.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  final AddBookToReadingUseCase addBookToReadingUseCase;
  final RemoveBookFromReadingUseCase removeBookFromReadingUseCase;
  final FetchReadingListUseCase fetchReadingListUseCase;

  ReadingBloc({
    required this.addBookToReadingUseCase,
    required this.removeBookFromReadingUseCase,
    required this.fetchReadingListUseCase,
  }) : super(ReadingInitial()) {
    on<AddBookToReadingEvent>((event, emit) async {
      var result = await addBookToReadingUseCase.call(event.book);
      result.fold(
        (failure) {
          log('AddBookToReadingEvent Failure: ${failure.message}');
          emit(ReadingFailure(failure.message));
        },
        (_) {
          emit(BookAddedToReading());
          add(FetchReadingListEvent());
        },
      );
    });

    on<RemoveBookFromReadingEvent>((event, emit) async {
      var result = await removeBookFromReadingUseCase.call(event.book);
      result.fold(
        (failure) {
          log('RemoveBookFromReadingEvent Failure: ${failure.message}');
          emit(ReadingFailure(failure.message));
        },
        (_) {
          emit(BookRemovedFromReading());
          add(FetchReadingListEvent());
        },
      );
    });

    on<FetchReadingListEvent>((event, emit) async {
      if (state is! ReadingSuccess) {
        emit(ReadingLoading());
      }
      var result = await fetchReadingListUseCase.call(NoParameter());
      result.fold(
        (failure) {
          log('FetchReadingListEvent Failure: ${failure.message}');
          emit(ReadingFailure(failure.message));
        },
        (books) {
          log('FetchReadingListEvent Success: ${books.length} books found');
          emit(ReadingSuccess(books));
        },
      );
    });
  }
}
