import 'package:flutter/material.dart';
import 'package:flutter_market_kurly_app/constants.dart';
import 'package:flutter_market_kurly_app/screens/main_screens.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  "Kurly",
                  style:
                      GoogleFonts.pacifico(fontSize: 28, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: TextButton(
                  child: Text("Continue"),
                  onPressed: () {
                    _completeSplash(context, MainScreens());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _completeSplash(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}
