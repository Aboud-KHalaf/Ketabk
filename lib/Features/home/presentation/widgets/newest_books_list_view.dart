import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/widgets/newest_books_list_view_item.dart';
import 'package:bookly/Features/home/presentation/widgets/pagination_loading.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
    required this.books,
    this.isLoadingMore = false,
  });

  final List<BookEntity> books;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: books.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == books.length) {
          return const PaginationLoading();
        }
        return BookListViewItem(
          book: books[index],
          index: index,
        );
      },
    );
  }
}
