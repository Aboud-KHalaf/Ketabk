import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_book_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> onRefresh(BuildContext cxt) async {
  BlocProvider.of<NewestBooksCubit>(cxt).fetchNewestBooks();
  BlocProvider.of<FeaturedBookCubit>(cxt).fetchFeaturedBooks();
  await Future.delayed(const Duration(seconds: 1));
}
