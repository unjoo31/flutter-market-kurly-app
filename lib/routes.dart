import 'package:flutter/material.dart';
import 'package:flutter_market_kurly_app/screens/main_screens.dart';
import 'package:flutter_market_kurly_app/screens/signin/signin_screen.dart';

import 'screens/details/details_screen.dart';
import 'screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MainScreens.routeName: (context) => MainScreens(),
  SignInScreen.routeName: (context) => SignInScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen()
};
