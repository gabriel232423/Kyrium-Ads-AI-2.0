import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard_screen.dart';
import 'kyra_assistant.dart';
import 'turbo_operation.dart';
import 'product_upload_screen.dart';
import 'platforms_screen.dart';
import 'models/app_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: KyriumApp(),
    ),
  );
}

class KyriumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kyrium Global Empire',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.black,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      home: DashboardScreen(),
      routes: {
        '/kyra': (context) => KyraAssistant(),
        '/turbo': (context) => TurboOperation(),
        '/upload': (context) => ProductUploadScreen(),
        '/platforms': (context) => PlatformsScreen(),
      },
    );
  }
}
