import 'package:bookly/Features/home/presentation/widgets/category_chip.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'Explore Genres',
                style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).cardColor.withOpacity(0.8),
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 36,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
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
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}
