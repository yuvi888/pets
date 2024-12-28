import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pets/common/bottombar.dart';
import 'package:pets/common/colors.dart';
import 'package:pets/screens/authscreen.dart';
import 'package:pets/screens/homescreeen.dart';
import 'package:pets/screens/signinscreen.dart';
import 'package:pets/screens/signupscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkInternetAndNavigate();
   
  }

  Future<void> _checkUser() async {
    await Future.delayed(
        Duration(seconds: 7)); // Simulate a delay for splash screen
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomBar()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen()),
      );
    }
  }

  Future<void> _checkInternetAndNavigate() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // No internet connection
      // You can display an error message or show a dialog here
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('No Internet Connection'),
          content: Text('Please check your internet connection.'),
          actions: <Widget>[
            GestureDetector(
              onTap: () => _retry(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      _checkUser();
    }
  }

  void _retry() {
    Navigator.pop(context); // Close the AlertDialog
    _checkInternetAndNavigate(); // Retry internet connection check
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: screenSize.height * 0.250,
            ),
            Container(
              alignment: Alignment.center,
              // ignore: prefer_const_constructors
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DelayedDisplay(
                    delay: const Duration(seconds: 2),
                    fadeIn: true,
                    slidingBeginOffset: const Offset(0, -1),
                    child: Text(
                      'Welcome To ',
                      style: GoogleFonts.pacifico(
                        shadows: [
                          const Shadow(
                              color: Color.fromARGB(197, 100, 100, 100),
                              offset: Offset(1, 2),
                              blurRadius: 1),
                        ],
                        fontSize: screenSize.height * 0.045,
                        fontWeight: FontWeight.w200,
                        // fontStyle: FontStyle.italic,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  DelayedDisplay(
                    delay: const Duration(seconds: 3),
                    fadeIn: true,
                    slidingBeginOffset: const Offset(-1, 0),
                    child: Text(
                      "pet's",
                      style: GoogleFonts.pacifico(
                        shadows: [
                          const Shadow(
                              color: Color.fromARGB(197, 100, 100, 100),
                              offset: Offset(1, 2),
                              blurRadius: 1),
                        ],
                        fontSize: screenSize.height * 0.045,
                        fontWeight: FontWeight.w200,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //  SizedBox(
            //   height: screenSize.height*0.020,
            // ),
            DelayedDisplay(
              delay: const Duration(seconds: 3),
              fadeIn: true,
              slidingBeginOffset: const Offset(0, 3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Lottie.asset(
                  'assets/hdog.json',
                  height: screenSize.height * 0.350,
                  width: screenSize.width * 0.500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
