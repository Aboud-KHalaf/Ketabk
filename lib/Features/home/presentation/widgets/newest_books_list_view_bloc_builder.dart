import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/widgets/newest_books_list_view.dart';
import 'package:bookly/Features/home/presentation/widgets/newst_list_view_loading.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocBuilder extends StatefulWidget {
  const NewestBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<NewestBooksListViewBlocBuilder> createState() =>
      _NewestBooksListViewBlocBuilderState();
}

class _NewestBooksListViewBlocBuilderState
    extends State<NewestBooksListViewBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return BestSellerListView(
            books: state.books,
          );
        } else if (state is NewestBooksFailure) {
          return CustomEroorWidget(errMessage: state.errMessage);
        } else {
          return const NewestListViewLoading();
        }
      },
    );
  }
}
