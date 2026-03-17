import 'dart:ui';
import 'package:bookly/Features/home/presentation/widgets/theme_switcher.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    AssetsData.logo,
                    width: 90,
                  ),
                ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
                const Spacer(),
                const ThemeSwitcher(),
                const SizedBox(width: 12),
                _AppBarButton(
                  icon: Icons.bookmarks_rounded,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kReadingView);
                  },
                ),
                const SizedBox(width: 12),
                _AppBarButton(
                  icon: Icons.search_rounded,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kSearchView);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarButton extends StatefulWidget {
  const _AppBarButton({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  State<_AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<_AppBarButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
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
          boxShadow: [
            if (_isPressed)
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
          ],
        ),
        child: Icon(
          widget.icon,
          size: 22,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ).animate().fadeIn(delay: 400.ms, duration: 500.ms).scale(begin: const Offset(0.8, 0.8));
  }
}
