import 'package:bookly/Features/home/presentation/manager/cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/widgets/featured_books_list_view_bloc_builder.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custtom_newset_list_shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: CustomAppBar(),
              ),
              FeaturedBooksListViewBlocBuilder(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: NewestBooksListViewBlocBuilder(),
        ),
      ],
    );
  }
}

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
        context.read<NewestBooksCubit>().loadMoreBooks().then((_) {
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
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return BestSellerListView(
            books: state.books,
            scrollController: _scrollController,
          );
        } else if (state is NewestBooksFailure) {
          return Text(state.errMessage);
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: CustomNewestListShimmerItem(),
              );
            },
          );
        }
      },
    );
  }
}
