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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).cardColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.explore_outlined,
                  size: 16,
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                ),
                const SizedBox(width: 8),
                Text(
                  'Quick explore',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        fontSize: 10,
                        color: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.color
                            ?.withOpacity(0.6),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 38,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
      ),
    );
  }
}
