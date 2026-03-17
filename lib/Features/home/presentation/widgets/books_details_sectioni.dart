import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/widgets/book_specs_section.dart';
import 'package:bookly/Features/home/presentation/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'category_chip.dart';
import '../../../../core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .2,
              ),
              child: CustomBookImage(
                image: bookEntity.image!,
              ),
            ),
          ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
          const SizedBox(height: 32),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              bookEntity.titlel,
              style: Styles.textStyle25.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ).animate().fadeIn(duration: const Duration(milliseconds: 600)),
          const SizedBox(height: 8),
          Opacity(
            opacity: .7,
            child: Text(
              bookEntity.atutherName ?? 'No Name',
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ).animate().fadeIn(duration: const Duration(milliseconds: 700)),
          const SizedBox(height: 16),
          if (bookEntity.categories != null &&
              bookEntity.categories!.isNotEmpty)
            CategoryChip(
              category: bookEntity.categories![0],
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.kSearchView,
                  extra: bookEntity.categories![0],
                );
              },
            ).animate().fadeIn(duration: const Duration(milliseconds: 750)),
          const SizedBox(height: 12),
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ).animate().fadeIn(duration: const Duration(milliseconds: 800)),
          const SizedBox(height: 24),
          BookSpecsSection(
            bookEntity: bookEntity,
          ).animate().fadeIn(duration: const Duration(milliseconds: 850)),
          const SizedBox(height: 32),
          BooksAction(
            url: bookEntity.url!,
          ).animate().fadeIn(duration: const Duration(milliseconds: 900)),
        ],
      ),
    );
  }
}
