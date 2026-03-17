import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/manager/app_theme_cubit.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return _ThemeSwitcherButton(
          onTap: () => context.read<ThemeCubit>().toggleTheme(),
          icon: theme.brightness == Brightness.light
              ? Icons.dark_mode_rounded
              : Icons.light_mode_rounded,
        );
      },
    );
  }
}

class _ThemeSwitcherButton extends StatefulWidget {
  const _ThemeSwitcherButton({
    required this.onTap,
    required this.icon,
  });

  final VoidCallback onTap;
  final IconData icon;

  @override
  State<_ThemeSwitcherButton> createState() => _ThemeSwitcherButtonState();
}

class _ThemeSwitcherButtonState extends State<_ThemeSwitcherButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(10),
        transform: Matrix4.identity()
          ..scale(_isPressed ? 0.92 : 1.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
        ),
        child: Icon(
          widget.icon,
          size: 22,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
