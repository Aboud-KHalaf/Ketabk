import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/similar_books_cubit.dart/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView(
      {super.key, required this.bookEntity, this.showSimilarBooks = true});

  final BookEntity bookEntity;
  final bool showSimilarBooks;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(category: widget.bookEntity.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetailsViewBody(
          bookEntity: widget.bookEntity,
          showSimilarBooks: widget.showSimilarBooks,
        ),
      ),
    );
  }
}
