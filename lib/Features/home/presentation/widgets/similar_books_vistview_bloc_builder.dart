import 'package:bookly/Features/home/presentation/manager/similar_books_cubit.dart/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/widgets/similar_books_list_view.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListviewBlocBuilder extends StatelessWidget {
  const SimilarBooksListviewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SimilarBooksListview(books: state.books);
        } else if (state is SimilarBooksFailure) {
          return CustomEroorWidget(errMessage: state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
