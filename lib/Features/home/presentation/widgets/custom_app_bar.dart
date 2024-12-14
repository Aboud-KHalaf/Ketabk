import 'package:bookly/Features/home/presentation/widgets/theme_switcher.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          Hero(
            tag: 'logo',
            child: Image.asset(
              AssetsData.logo,
              width: 100,
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
