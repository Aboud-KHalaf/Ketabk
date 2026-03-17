import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/search/domain/repos/search_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchSearchedBooksUseCase
    extends UseCase<List<BookEntity>, SearchBooksParams> {
  final SearchRepo searchRepo;

  FetchSearchedBooksUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([SearchBooksParams? parm]) async {
    return await searchRepo.fetchSearchedBooks(
      searchText: parm!.searchText,
      orderBy: parm.orderBy,
    );
  }
}

class SearchBooksParams {
  final String searchText;
  final String? orderBy;

  SearchBooksParams({required this.searchText, this.orderBy});
}
