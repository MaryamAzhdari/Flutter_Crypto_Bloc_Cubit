import 'package:crypto_bloc_cubit/global_variable.dart';
import 'package:crypto_bloc_cubit/theme.dart';
import 'package:flutter/material.dart';


class CryptoRowWidget extends StatelessWidget {
  final String coinTitle, coinSign, price, percentage,image;

  const CryptoRowWidget(
      {super.key,
      required this.coinTitle,
      required this.coinSign,
      required this.price,
      required this.percentage,
      required this.image});

  @override
  Widget build(BuildContext context) {
    //var doublePrice = double.parse(price);
    //final priceFormat = NumberFormat("#,##0.00", "en_US");
    // final priceFormat = NumberFormat("#,##0", "en_US");
    // final percentageFormat = NumberFormat("#,##0.00", "en_US");

    var doublePercentage = double.parse(percentage);
    // ignore: sized_box_for_whitespace
    return Column(
      children: [
        Row(
          children: [
            Image.network('$imageUri'+image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        coinTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        price,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                            color: doublePercentage >= 0
                                ? AppTheme.positiveColor
                                : AppTheme.negativColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        coinSign,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const Spacer(),
                      Text(
                        doublePercentage >= 0 ?
                        "+$percentage %" : "$percentage %",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            color: doublePercentage >= 0
                                ? AppTheme.positiveColor
                                : AppTheme.negativColor),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10,),
              Divider(height: 1,color: AppTheme.whiteColor.withOpacity(0.2),),
              const SizedBox(height: 10,)
      ],
    );
  }
}
