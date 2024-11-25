import 'package:crypto_bloc_cubit/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.onTap, required this.title, super.key});

  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap?.call(),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppTheme.btnColor,
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                title,
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.1,
                  color: AppTheme.backColorDark,
                ),
              )),
        ),
      ),
    );
  }
}
