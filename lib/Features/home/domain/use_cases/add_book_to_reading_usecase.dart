import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/reading_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class AddBookToReadingUseCase extends UseCase<void, BookEntity> {
  final ReadingRepo readingRepo;

  AddBookToReadingUseCase(this.readingRepo);

  @override
  Future<Either<Failure, void>> call([BookEntity? param]) {
    return readingRepo.addBookToReading(param!);
  }
}
