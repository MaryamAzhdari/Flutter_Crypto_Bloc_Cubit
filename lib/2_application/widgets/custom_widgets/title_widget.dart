import 'package:crypto_bloc_cubit/theme.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container()
          ],
          
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          height: 2,
          color: AppTheme.whiteColor,
        ),
      ],
    );
  }
}
