import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            text: 'Free',
            backgroundColor: Theme.of(context).cardColor.withOpacity(0.9),
            textColor: Colors.green,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              if (url != 'noLink') {
                final Uri uri = Uri.parse(url);
                _launchUrl(uri);
              } else {
                // code
              }
            },
            fontSize: 16,
            text: 'Free Preview',
            backgroundColor: Theme.of(context).hintColor.withOpacity(0.9),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          )),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw Exception('Could not launch $url');
  }
}
