import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_book_cubit.dart';
import 'package:bookly/Features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh() async {
      BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
      BlocProvider.of<FeaturedBookCubit>(context).fetchFeaturedBooks();
      await Future.delayed(const Duration(seconds: 1));
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: const HomeViewBody(),
      ),
    );
  }
}
