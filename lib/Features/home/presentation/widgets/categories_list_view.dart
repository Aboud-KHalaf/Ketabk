import 'package:bookly/Features/home/presentation/widgets/category_chip.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  static const List<String> categories = [
    'Programming',
    'Business',
    'Self-Help',
    'History',
    'Art',
    'Science',
    'Cookery',
    'Fiction',
    'Travel',
    'Biography',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryChip(
            category: categories[index],
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kSearchView,
                extra: categories[index],
              );
            },
          ).animate().fadeIn(
                delay: Duration(milliseconds: index * 50),
                duration: const Duration(milliseconds: 500),
              );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: categories.length,
      ),
    );
  }
}
