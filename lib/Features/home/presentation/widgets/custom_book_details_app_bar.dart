import 'package:bookly/Features/home/presentation/manager/reading_bloc/reading_bloc.dart';
import 'package:bookly/Features/home/presentation/manager/reading_bloc/reading_event.dart';
import 'package:bookly/Features/home/presentation/manager/reading_bloc/reading_state.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:bookly/Features/home/domain/entities/book_entity.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconButton(
                context,
                icon: Icons.arrow_back_ios_new,
                onPressed: () {
                  if (GoRouter.of(context).canPop()) {
                    GoRouter.of(context).pop();
                  } else {
                    GoRouter.of(context).go(AppRouter.kHomeView);
                  }
                },
                tooltip: 'Back',
              ).animate().fadeIn(duration: 300.ms).slideX(begin: -0.2),
              BlocBuilder<ReadingBloc, ReadingState>(
                builder: (context, state) {
                  bool isSaved = false;
                  if (state is ReadingSuccess) {
                    isSaved = state.books
                        .any((book) => book.bookId == bookEntity.bookId);
                  }

                  return _buildIconButton(
                    context,
                    icon: isSaved ? Icons.bookmark : Icons.bookmark_outline,
                    iconColor: isSaved ? Colors.orange : null,
                    onPressed: () {
                      if (isSaved) {
                        context
                            .read<ReadingBloc>()
                            .add(RemoveBookFromReadingEvent(bookEntity));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Removed from reading list'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else {
                        context
                            .read<ReadingBloc>()
                            .add(AddBookToReadingEvent(bookEntity));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to reading list'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    tooltip: isSaved ? 'Remove from reading' : 'Add to reading',
                  )
                      .animate(
                        key: ValueKey(isSaved),
                      )
                      .scale(
                        duration: 200.ms,
                        begin: const Offset(0.8, 0.8),
                        end: const Offset(1, 1),
                        curve: Curves.elasticOut,
                      )
                      .shimmer(
                        duration: 1000.ms,
                        color: Colors.white24,
                      );
                },
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 200.ms);
  }

  Widget _buildIconButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onPressed,
    required String tooltip,
    Color? iconColor,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: tooltip,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  icon,
                  color: iconColor ?? Theme.of(context).primaryColor,
                  size: 22,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
