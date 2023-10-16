import 'package:flutter/material.dart';
import 'package:flutter_market_kurly_app/routes.dart';
import 'package:flutter_market_kurly_app/screens/splash/splash_screen.dart';
import 'package:flutter_market_kurly_app/theme.dart';

void main() {
  runApp(const MarketKurly());
}

class MarketKurly extends StatelessWidget {
  const MarketKurly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Market Kurly UI",
      initialRoute: SplashScreen.routeName,
      routes: route,
      theme: theme(),
    );
  }
}
