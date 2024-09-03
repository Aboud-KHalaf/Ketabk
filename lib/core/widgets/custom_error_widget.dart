import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/functions/refresh.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomEroorWidget extends StatelessWidget {
  const CustomEroorWidget({
    required this.errMessage,
    super.key,
    this.withRefrech = true,
  });

  final String errMessage;
  final bool withRefrech;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .7,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AssetsData.errorAnmiation, width: 200),
            Text(
              errMessage,
              textAlign: TextAlign.center,
              style: Styles.textStyle18.copyWith(
                color: Theme.of(context).disabledColor,
              ),
            ),
            const SizedBox(height: 10),
            withRefrech
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).hintColor,
                    ),
                    child: TextButton(
                      onPressed: () {
                        onRefresh(context);
                      },
                      child: Text(
                        'try again',
                        style: Styles.textStyle18.copyWith(
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
