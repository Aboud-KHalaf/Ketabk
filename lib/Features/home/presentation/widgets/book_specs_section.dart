import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookSpecsSection extends StatelessWidget {
  const BookSpecsSection({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _BookSpecItem(
            icon: FontAwesomeIcons.bookOpen,
            label: '${bookEntity.pageCount ?? 'N/A'} Pages',
          ),
          const _VerticalDivider(),
          _BookSpecItem(
            icon: FontAwesomeIcons.globe,
            label: (bookEntity.language ?? 'N/A').toUpperCase(),
          ),
          const _VerticalDivider(),
          _BookSpecItem(
            icon: FontAwesomeIcons.calendarDay,
            label: bookEntity.publishedDate ?? 'N/A',
          ),
          if (bookEntity.rating == 'MATURE') ...[
            const _VerticalDivider(),
            const _BookSpecItem(
              icon: FontAwesomeIcons.triangleExclamation,
              label: '18+',
              color: Colors.redAccent,
            ),
          ],
        ],
      ),
    );
  }
}

class _BookSpecItem extends StatelessWidget {
  const _BookSpecItem({
    required this.icon,
    required this.label,
    this.color,
  });

  final IconData icon;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Icon(
            icon,
            size: 18,
            color: color ?? Theme.of(context).primaryColor.withOpacity(0.7),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
              color: color ?? Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 1,
      color: Theme.of(context).dividerColor.withOpacity(0.1),
    );
  }
}
