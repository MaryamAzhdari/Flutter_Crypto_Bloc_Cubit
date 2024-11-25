import 'package:crypto_bloc_cubit/1_domain/entities/crypto_entity.dart';
import 'package:crypto_bloc_cubit/2_application/core/cubit/crypto_cubit.dart';
import 'package:crypto_bloc_cubit/2_application/widgets/custom_widgets/crypto_row_widget.dart';
import 'package:crypto_bloc_cubit/2_application/widgets/custom_widgets/custom_button.dart';
import 'package:crypto_bloc_cubit/2_application/widgets/custom_widgets/title_widget.dart';
import 'package:crypto_bloc_cubit/2_application/widgets/custom_widgets/wallet_widget.dart';
import 'package:crypto_bloc_cubit/2_application/widgets/error_message.dart';
import 'package:crypto_bloc_cubit/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

class CryptoCompareMain extends StatelessWidget {
  const CryptoCompareMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CryptoCubit>(),
      child: const CryptoPage(),
    );
  }
}

class CryptoPage extends StatelessWidget {
  const CryptoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: AppTheme.backColorDark,
        appBar: AppBar(
          backgroundColor: AppTheme.backColorDark,
          title: Text(
            'Top Cryptos',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Add width condition of Web
            if (constraints.maxWidth > 600) {
              return _buildWeb(context, themeData);
            } else {
              return _buildMobile(context, themeData);
            }
          },
        ));
  }

  Container _buildWeb(BuildContext context, ThemeData themeData) {
    return Container(
      color: AppTheme.backColorDark,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const Divider(
                height: 2,
                color: AppTheme.whiteColor,
              ),
              banner(100),
              const SizedBox(
                height: 30,
              ),
              walletRow(7),
              const SizedBox(
                height: 30,
              ),
              const TitleWidget(
                title: 'رمز ارزهای برتر',
              ),
              const SizedBox(
                height: 20,
              ),
              resultServer(context, themeData),
              SizedBox(
                height: 100,
                child: Center(
                  child: CustomButton(
                    title: 'Get Top 10 Cryptos',
                    onTap: () =>
                        BlocProvider.of<CryptoCubit>(context).cryptoRequested,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildMobile(BuildContext context, ThemeData themeData) {
    return Container(
      color: AppTheme.backColorDark,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(
                height: 2,
                color: AppTheme.whiteColor,
              ),
              banner(200),
              const SizedBox(
                height: 30,
              ),
              walletRow(2.5),
              const SizedBox(
                height: 30,
              ),
              const TitleWidget(
                title: 'رمز ارزهای برتر',
              ),
              const SizedBox(
                height: 20,
              ),
              resultServer(context, themeData),
              SizedBox(
                height: 100,
                child: Center(
                  child: CustomButton(
                    title: 'Get Top 10 Cryptos',
                    onTap: () =>
                        BlocProvider.of<CryptoCubit>(context).cryptoRequested,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Image banner(double picSize) {
    return Image.asset(
      'assets/images/safety.png',
      width: picSize,
      height: picSize,
      color: AppTheme.whiteColor,
      fit: BoxFit.cover,
    );
    //Package For Shadow - But not work in asset image
    // DecoratedIcon(
    //   Icons.exposure_zero,
    //   color: Colors.lightBlue.shade50,
    //   size: 200.0,
    //   shadows:  [
    //     BoxShadow(
    //       blurRadius: 30.0,
    //       color: AppTheme.whiteColor.withOpacity(0.3),
    //     ),
    //     BoxShadow(
    //       blurRadius: 30.0,
    //       color: AppTheme.whiteColor.withOpacity(0.3),
    //       offset: Offset(0, 6.0),
    //     ),
    //   ],
    // ),

    //Defult Shadow
    // Icon(
    //   Icons.fiber_new_sharp,
    //   color: AppTheme.whiteColor,
    //   size: 200,
    //  ),
  }

  IntrinsicHeight walletRow(double cardSize) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WalletWidget(
            title1: 'ایجاد کیف پول',
            title2: 'هوشمند',
            title3: 'کیف پول دارم',
            size: cardSize,
          ),
          const SizedBox(
            width: 5,
          ),
          const VerticalDivider(
            color: AppTheme.whiteColor,
            thickness: 1,
          ),
          const SizedBox(
            width: 5,
          ),
          WalletWidget(
            title1: 'ایجاد کیف پول',
            title2: 'شخصی',
            title3: 'بازیابی کیف پول',
            size: cardSize,
          ),
        ],
      ),
    );
  }

  Center resultServer(BuildContext context, ThemeData themeData) {
    var cryptos;
    BlocProvider.of<CryptoCubit>(context).cryptoRequested;
    return Center(
      child: BlocBuilder<CryptoCubit, CryptoCubitState>(
        builder: (context, state) {
          if (state is CryptoInitial) {
            return Text(
              'Pls press the Button!',
              style: Theme.of(context).textTheme.titleSmall,
            );
          } else if (state is CryptoStateLoading) {
            return CircularProgressIndicator(
              color: themeData.colorScheme.secondary,
            );
          } else if (state is CryptoStateLoaded) {
            // CryptoField(
            //   data: state.data,
            // );
            cryptos = state.data;
            return SizedBox(
              height: 300,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    // CoinInfo coinInfo = CoinInfo.props(
                    //     cryptos["Data"][index]["CoinInfo"]);
                    // USD_DISPLAY display =
                    //     USD_DISPLAY.fromJson(cryptos["Data"]
                    //         [index]["DISPLAY"]["USD"]);
                    CoinInfo coinInfo =
                        CoinInfo.fromJson(cryptos["Data"][index]["CoinInfo"]);
                    USD_DISPLAY display = USD_DISPLAY
                        .fromJson(cryptos["Data"][index]["DISPLAY"]["USD"]);

                    //List<dynamic> data = cryptos['Data'];
                    return CryptoRowWidget(
                      coinTitle: coinInfo.FullName,
                      coinSign: coinInfo.Name,
                      price: display.PRICE,
                      percentage: display.CHANGEPCT24HOUR,
                      image: coinInfo.imageUrl,
                    );
                  }),
            );
          } else if (state is CryptoStateError) {
            return ErrorMessage(message: state.message);
          }
          return SizedBox();
        },
      ),
    );
  }
}
