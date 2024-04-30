import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_ai_test/constants.dart';
import 'package:open_ai_test/extensions/context_extension.dart';
import 'package:open_ai_test/views/home_view.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KlaarGPT',
      theme: ThemeData(
        textTheme: TextTheme(
            bodyMedium: TextStyle(
          fontSize: context.mqSize.height * 0.0228,
          color: textColor,
        )),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.grey,
          selectionHandleColor: Colors.grey,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          background: backgroundColor,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: backgroundColor,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: textColor,
              fontSize: context.mqSize.height * 0.028,
              fontWeight: FontWeight.bold,
            ),
            elevation: 0.5,
            surfaceTintColor: backgroundColor,
            shadowColor: Colors.grey[400],
            actionsIconTheme: const IconThemeData(
              color: iconColor,
            )),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
