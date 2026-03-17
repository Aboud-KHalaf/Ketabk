import 'package:bookly/Features/home/presentation/manager/reading_bloc/reading_bloc.dart';
import 'package:bookly/Features/home/presentation/manager/reading_bloc/reading_state.dart';
import 'package:bookly/Features/home/presentation/widgets/reading_list_view.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:bookly/core/utils/styles.dart';

class ReadingViewBody extends StatelessWidget {
  const ReadingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(
                color: Theme.of(context).primaryColor.withOpacity(0.05),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocBuilder<ReadingBloc, ReadingState>(
              builder: (context, state) {
                if (state is ReadingSuccess) {
                  if (state.books.isEmpty) {
                    return _buildEmptyState(context);
                  }
                  return ReadingListView(books: state.books);
                } else if (state is ReadingFailure) {
                  return Center(
                    child: Text(
                      state.errMessage,
                      style: Styles.textStyle16.copyWith(color: Colors.redAccent),
                    ),
                  );
                } else {
                  return Center(
                    child: Lottie.asset(
                      AssetsData.bookLoadingAnimation,
                      width: 200,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
            child: Icon(
              Icons.bookmark_border_rounded,
              size: 64,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Your Reading List is Empty',
            style: Styles.textStyle20.copyWith(
              color: Theme.of(context).hintColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start adding books you want to read!',
            textAlign: TextAlign.center,
            style: Styles.textStyle16.copyWith(
              color: Theme.of(context).hintColor.withOpacity(0.7),
            ),
          ),
        ],
      ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final Color color;

  BackgroundPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // First layer
    final path1 = Path();
    path1.moveTo(0, size.height * 0.25);
    path1.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.15,
      size.width * 0.6,
      size.height * 0.3,
    );
    path1.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.4,
      size.width,
      size.height * 0.35,
    );
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();
    canvas.drawPath(path1, paint);

    // Second layer (slightly deeper)
    final path2 = Path();
    path2.moveTo(0, size.height * 0.4);
    path2.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.3,
      size.width,
      size.height * 0.5,
    );
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);
    path2.close();
    canvas.drawPath(path2, Paint()
      ..color = color.withOpacity(color.opacity * 0.5)
      ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
