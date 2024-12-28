import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets/common/bottombar.dart';
import 'package:pets/common/colors.dart';
import 'package:pets/common/constant.dart';
import 'package:pets/common/custombutton.dart';
import 'package:pets/common/customfield.dart';
import 'package:pets/screens/homescreeen.dart';
import 'package:pets/screens/signupscreen.dart';
import 'package:pets/services/authservices.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  Future<void> signIn() async {
     setState(() {
      _isLoading = true; // Show the progress indicator
    });
    User? user = await _authService.signIn(
      context:context,
      email: emailController.text,
      password: passwordController.text,
    );
     setState(() {
      _isLoading = false; // Show the progress indicator
    });

    if (user != null) {
      // Navigate to the home page or another page
      showCustomAlertDialog(context, "User Successfully Signed In");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBar(),
        ),
      );
      // You can navigate to another screen or show a success message here
    } else {
    //showCustomAlertDialog(context,'Sign in failed');
      // Show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,

      appBar: AppBar(
        leading: const BackButton(
          color: GlobalVariables.blbackgroundColor, // <-- SEE HERE
        ),
        centerTitle: true,
        backgroundColor: GlobalVariables.backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
          "Sign In",
          style: TextStyle(
              color: GlobalVariables.blbackgroundColor,
              fontSize: screenSize.height * 0.025,
              fontWeight: FontWeight.bold),
        ),
      ),

// PreferredSize(

//    preferredSize: Size.fromHeight(110), // Set this height
//   child:Container(
//     height: 110,
//     decoration: BoxDecoration(
//       //boxShadow: [BoxShadow(color: const Color.fromARGB(255, 0, 0, 0),offset: Offset(1, 1),blurRadius: 5)],
//       color: Color(0xFFe1e3e3),
//        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),

//     ),
//     child: Center(
//       child: Text(
//               "SignIn",
//               style: const TextStyle(
//                   color: Color.fromARGB(255, 0, 0, 0),
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//     ),
//   )
//   ),
      body: Stack(
        children: [
          //   Image.asset(
          //   'assets/wall-wallpaper-concrete-colored-painted-textured-concept.jpg',
          //   // Replace with your image path
          //   fit: BoxFit.cover,
          //   height: double.infinity,
          // ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //     Container(
                //      height: 80,
                //      width: 200,
                //      color: Color.fromARGB(255, 55, 93, 93),
                //      child: Text(
                //   "hii i am rockyy",
                //   style: const TextStyle(
                //       color: Color.fromARGB(255, 255, 255, 255),
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold),
                // ),
                //     ),
                //     Container(
                //      height: 80,
                //      width: 200,
                //      color: Color(0XFF608e8e),
                //       child: Text(
                //   "hii i am rockyy",
                //   style: const TextStyle(
                //       color: Color(0XFFc5d0d3),
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold),
                // ),
                //     ),

                DelayedDisplay(
                  delay: const Duration(seconds: 1),
                  fadeIn: true,
                  slidingBeginOffset: const Offset(0, -1),
                  child: Text(
                    "pet's",
                    style: GoogleFonts.pacifico(
                      shadows: [
                        const Shadow(
                            color: Color.fromARGB(197, 0, 0, 0),
                            offset: Offset(1, 1),
                            blurRadius: 8),
                      ],
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                      color: GlobalVariables.blbackgroundColor,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                DelayedDisplay(
                  delay: const Duration(seconds: 1),
                  fadeIn: true,
                  slidingBeginOffset: const Offset(-1, 0),
                  child: CustomTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DelayedDisplay(
                  delay: const Duration(seconds: 1),
                  fadeIn: true,
                  slidingBeginOffset: const Offset(0, 1),
                  child: CustomTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                  ),
                ),

                const SizedBox(height: 30),
                DelayedDisplay(
                    delay: const Duration(seconds: 1),
                    fadeIn: true,
                    slidingBeginOffset: const Offset(0, 1),
                    child: CustomButton(
                      text: 'Sign In',
                      onTap: () {
                        signIn();
                      },
                      height: screenSize.height * 0.047,
                      width: screenSize.width * 0.350,
                      fontSize: screenSize.height * 0.015,
                    )),

                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up ?',
                    style: TextStyle(
                        color: GlobalVariables.blbackgroundColor, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
                Center(
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),),
                ),
        ],
      ),
    );
  }
}
