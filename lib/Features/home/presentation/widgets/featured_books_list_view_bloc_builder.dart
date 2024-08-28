import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_book_cubit.dart';
import 'package:bookly/Features/home/presentation/widgets/featured_list_view.dart';
import 'package:bookly/Features/home/presentation/widgets/featured_shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocBuilder> {
  late ScrollController _scrollController;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      //
      var currentPostition = _scrollController.position.pixels;
      var maxPosition = _scrollController.position.maxScrollExtent;
      //
      if (currentPostition >= maxPosition * 0.8 && !_isLoadingMore) {
        _isLoadingMore = true;
        context.read<FeaturedBookCubit>().loadMoreBooks().then((_) {
          _isLoadingMore = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return FeaturedBooksListView(
            books: state.books,
            scrollController: _scrollController,
          );
        } else if (state is FeaturedBookFailure) {
          return const SizedBox();
        } else {
          return const Center(child: FeaturedShimmerList());
        }
      },
    );
  }
}
