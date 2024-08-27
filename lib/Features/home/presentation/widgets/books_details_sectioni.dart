import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .2,
            ),
            child: CustomBookImage(
              image: bookEntity.image!,
            ),
          ),
          const SizedBox(
            height: 43,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              bookEntity.titlel,
              style: Styles.textStyle25.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Opacity(
            opacity: .7,
            child: Text(
              bookEntity.atutherName ?? 'No Name',
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(
            height: 37,
          ),
          const BooksAction(
            url: '',
          ),
        ],
      ),
    );
  }
}
