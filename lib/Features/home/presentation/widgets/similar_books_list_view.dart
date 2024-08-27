import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/similar_books_cubit.dart/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/widgets/custom_book_image.dart';
import 'package:bookly/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key, required this.books});

  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .20,
      child: ListView.builder(
          itemCount: books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(goToBookDetailView(index));
                },
                child: CustomBookImage(image: books[index].image!),
              ),
            );
          }),
    );
  }

  MaterialPageRoute<dynamic> goToBookDetailView(int index) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
              create: (context) => sl<SimilarBooksCubit>(),
              child: BookDetailsView(
                bookEntity: books[index],
                showSimilarBooks: false,
              ),
            ));
  }
}
