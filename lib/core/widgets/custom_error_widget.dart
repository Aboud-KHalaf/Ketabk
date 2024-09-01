import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomEroorWidget extends StatelessWidget {
  const CustomEroorWidget({
    required this.errMessage,
    super.key,
  });

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AssetsData.bookAnimation),
          Text(
            errMessage,
            textAlign: TextAlign.center,
            style: Styles.textStyle18.copyWith(
              color: Theme.of(context).disabledColor,
            ),
          ),
        ],
      ),
    );
  }
}
