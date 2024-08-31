import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/manager/app_theme_cubit.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return GestureDetector(
          onTap: () => context.read<ThemeCubit>().toggleTheme(),
          child: SizedBox(
            child: Icon(
              theme.brightness == Brightness.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Theme.of(context).hintColor,
            ),
          ),
        );
      },
    );
  }
}
