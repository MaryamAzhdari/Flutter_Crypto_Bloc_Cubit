import 'package:crypto_bloc_cubit/2_application/widgets/crypto_compare_main.dart';
import 'package:crypto_bloc_cubit/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '2_application/core/services/theme_service.dart';
import 'injection.dart' as di; // di = dependency injection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //Consumer describtion : https://jetpack-compose.ir/blog-details/Bloc-Consumer-در-فلاتر-چیست
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.darkTheme,
        darkTheme: AppTheme.darkTheme,
        home: const CryptoCompareMain(),
      );
    });
  }
}
