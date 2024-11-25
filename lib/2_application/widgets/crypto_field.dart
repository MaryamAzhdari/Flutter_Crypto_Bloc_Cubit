import 'package:flutter/material.dart';

class CryptoField extends StatelessWidget {
  static String emptyAdvice = 'What should i do with an empty advice?!';

  final Map<String, dynamic> data;
  const CryptoField({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: themeData.colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(
              data.isNotEmpty ? '''" $data "''' : emptyAdvice,
              style: themeData.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}