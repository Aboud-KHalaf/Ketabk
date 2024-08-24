import 'package:bookly/core/widgets/custom_newset_list_shimmer_item.dart';
import 'package:flutter/material.dart';

class NewestListViewLoading extends StatelessWidget {
  const NewestListViewLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: CustomNewestListShimmerItem(),
        );
      },
    );
  }
}
