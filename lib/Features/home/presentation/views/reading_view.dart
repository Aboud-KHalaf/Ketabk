import 'package:bookly/Features/home/presentation/manager/reading_bloc/reading_bloc.dart';
import 'package:bookly/Features/home/presentation/manager/reading_bloc/reading_event.dart';
import 'package:bookly/Features/home/presentation/widgets/reading_view_body.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReadingView extends StatefulWidget {
  const ReadingView({super.key});

  @override
  State<ReadingView> createState() => _ReadingViewState();
}

class _ReadingViewState extends State<ReadingView> {
  @override
  void initState() {
    super.initState();
    context.read<ReadingBloc>().add(FetchReadingListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 12, right: 24),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (GoRouter.of(context).canPop()) {
                        GoRouter.of(context).pop();
                      } else {
                        GoRouter.of(context).go(AppRouter.kHomeView);
                      }
                    },
                    icon: const Icon(Icons.arrow_back_ios_new, size: 22),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'My Library',
                    style: Styles.textStyle25.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const Hero(
                    tag: 'logo',
                    child: Icon(
                      Icons.bookmarks_rounded,
                      size: 28,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.1, end: 0),
            ),
            const Expanded(
              child: ReadingViewBody(),
            ),
          ],
        ),
      ),
    );
  }
}
