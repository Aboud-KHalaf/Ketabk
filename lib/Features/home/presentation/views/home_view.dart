import 'package:bookly/Features/home/presentation/widgets/home_view_body.dart';
import 'package:bookly/core/utils/functions/refresh.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await onRefresh(context);
        },
        child: const HomeViewBody(),
      ),
    );
  }
}
