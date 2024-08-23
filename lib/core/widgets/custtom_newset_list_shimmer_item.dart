import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNewestListShimmerItem extends StatelessWidget {
  const CustomNewestListShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                ),
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Container(
                  height: 15,
                  width: 200,
                  color: Colors.white,
                ),
                const SizedBox(height: 30),
                Container(
                  height: 15,
                  width: 150,
                  color: Colors.white,
                ),
                const Expanded(child: SizedBox(height: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 15,
                      width: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 100),
                    Container(
                      height: 15,
                      width: 50,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
