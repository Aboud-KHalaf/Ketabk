import 'package:bookly/Features/home/presentation/manager/similar_books_cubit.dart/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/widgets/similar_books_list_view.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              state.errMessage,
              style: Styles.textStyle16.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            )),
          );
        } else {
          return Center(
            child: Lottie.asset(AssetsData.bookLoadingAnimation, height: 60),
          );
        }
      },
    );
  }
}
