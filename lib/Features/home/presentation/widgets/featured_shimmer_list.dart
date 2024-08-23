import 'package:bookly/core/widgets/loading_shimmer_widget.dart';
import 'package:flutter/material.dart';

class FeaturedShimmerList extends StatelessWidget {
  const FeaturedShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: LoadingShimmerWidget(),
        ),
      ),
    );
  }
}
