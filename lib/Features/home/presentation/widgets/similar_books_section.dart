import 'package:bookly/Features/home/presentation/widgets/similar_books_vistview_bloc_builder.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You can also like',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SimilarBooksListviewBlocBuilder(),
        ],
      ),
    );
  }
}
