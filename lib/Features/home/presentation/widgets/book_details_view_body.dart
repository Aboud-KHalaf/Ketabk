import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/widgets/similar_books_section.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'books_details_sectioni.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody(
      {super.key, required this.bookEntity, this.showSimilarBooks = true});
  final BookEntity bookEntity;
  final bool showSimilarBooks;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const CustomBookDetailsAppBar(),
              BookDetailsSection(
                bookEntity: bookEntity,
              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              (showSimilarBooks == true)
                  ? const SimilarBooksSection()
                  : const SizedBox(),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
