import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUsecase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUsecase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([String? parm]) async {
    return await homeRepo.fetchSimilarBooks(category: parm!);
  }
}
