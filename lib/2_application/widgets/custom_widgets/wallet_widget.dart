import 'package:crypto_bloc_cubit/theme.dart';
import 'package:flutter/material.dart';

class WalletWidget extends StatelessWidget {
  final String title1,title2,title3 ;
  final double size;
  const WalletWidget({super.key, required this.title1, required this.title2, required this.title3, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / size,
          height: MediaQuery.of(context).size.width / (size + 1.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: AppTheme.greyColor.withOpacity(0.4),
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_circle,
                color: AppTheme.yellowColor,
                size: 26,
              ),
              const SizedBox(height: 10,),
              Text(title1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,),
              Text(title2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,),
            ],
          ),
        ),
        const SizedBox(height: 16,),
          Text(title3,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}
