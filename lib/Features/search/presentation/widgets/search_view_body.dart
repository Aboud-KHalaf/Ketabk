import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/widgets/newest_books_list_view_item.dart';
import 'package:bookly/Features/search/presentation/manager/cubit/search_cubit_cubit.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onSubmitted: (searchText) {
              BlocProvider.of<SearchBooksCubit>(context)
                  .fetchSearchedBooks(searchText: searchText);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
            child: SearchResultBlocBuilder(),
          ),
        ],
      ),
    );
  }
}

class SearchResultBlocBuilder extends StatelessWidget {
  const SearchResultBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return SearchResultListView(books: state.books);
        } else if (state is SearchBooksLoading) {
          return Lottie.asset(AssetsData.bookLoadingAnimation);
        } else if (state is SearchBooksFailure) {
          return CustomEroorWidget(
            errMessage: state.errMessage,
            withRefrech: false,
          );
        } else {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Search for Books',
                style: Styles.textStyle20,
              ),
              SizedBox(
                width: double.infinity,
              )
            ],
          );
        }
      },
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});

  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Search Result'),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(book: books[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
