import 'package:bookly/Features/home/presentation/widgets/theme_switcher.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Theme.of(context)
                .hintColor, // Base color for the shimmer effect
            highlightColor: Theme.of(context)
                .scaffoldBackgroundColor, // Highlight color for the shimmer effect
            child: const Text(
              'YourBook',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors
                    .white, // Text color (base color is overridden by shimmer effect)
              ),
            ),
          ),
          const Spacer(),
          const ThemeSwitcher(),
          const SizedBox(width: 6),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
                color: Theme.of(context).hintColor,
              ))
        ],
      ),
    );
  }
}
