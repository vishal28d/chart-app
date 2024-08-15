import 'package:chart_app/screens/chartScreen.dart';
import 'package:chart_app/screens/homeScreen.dart';
import 'package:chart_app/screens/firstPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Firstpage(),
      ),
      GoRoute(
        path: '/details',
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      theme: ThemeData.light(),  // Replace with your actual theme if needed
      darkTheme: ThemeData.light(),
      themeMode: ThemeMode.system,
      supportedLocales: [Locale('en', 'US')],
      localeResolutionCallback: (locale, supportedLocales) {
        return Locale('en', 'US');  // Modify this to handle more locales
      },
    );
  }
}
