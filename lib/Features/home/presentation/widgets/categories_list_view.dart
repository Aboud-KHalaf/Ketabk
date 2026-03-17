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
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).cardColor.withOpacity(0.08),
            Theme.of(context).cardColor.withOpacity(0.02),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).cardColor.withOpacity(0.12),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.explore,
                        size: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'EXPLORE GENRES',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                            fontSize: 9,
                            color: Theme.of(context).primaryColor.withOpacity(0.8),
                          ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: Theme.of(context).cardColor.withOpacity(0.3),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
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
