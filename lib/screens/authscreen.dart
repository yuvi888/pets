import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pets/common/colors.dart';
import 'package:pets/common/custombutton.dart';
import 'package:pets/screens/signinscreen.dart';
import 'package:pets/screens/signupscreen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: 
         
          Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 SizedBox(
                  height: screenSize.height*0.150,
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
                            shadows:[ const Shadow(color: Color.fromARGB(197, 100, 100, 100),offset: Offset(1, 2),blurRadius: 1),],
                                fontSize: MediaQuery.of(context).size.height * 0.045,
                                fontWeight: FontWeight.w200,
                                //fontStyle: FontStyle.italic,
                                color:const Color.fromARGB(255, 0, 0, 0),
                          ),
                  
                          ),
                          ),
                      DelayedDisplay(
                          delay: const Duration(seconds: 3),
                          fadeIn: true,
                          slidingBeginOffset: const Offset(-1, 0),
                          child:  Text(
                            "pet's",
                            style: GoogleFonts.pacifico(
                                shadows:[ const Shadow(color: Color.fromARGB(197, 100, 100, 100),offset: Offset(1, 2),blurRadius: 1),],
                                fontSize: MediaQuery.of(context).size.height * 0.045,
                                fontWeight: FontWeight.w200,
                                color:const Color.fromARGB(255, 0, 0, 0),
                          ),
                          ),
                          ),
                    ],
                  ),
                ),
                
                DelayedDisplay(
                        delay: const Duration(seconds: 3),
                        fadeIn: true,
                        slidingBeginOffset: const Offset(0, 3),
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Lottie.asset(
                       'assets/cat.json',   
                        height: MediaQuery.of(context).size.height * 0.400,
                         width: MediaQuery.of(context).size.width * 0.500,
                      ),
                    ),
                  ),
                SizedBox(
                  height: screenSize.height*0.080,
                ),
                
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DelayedDisplay(
                        delay: const Duration(seconds: 3),
                        fadeIn: true,
                        slidingBeginOffset: const Offset(0, 3),
                        child: CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          height:screenSize.height*0.050,
                          width:screenSize.width*0.400,
                          fontSize:screenSize.height*0.015,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DelayedDisplay(
                        delay: const Duration(seconds: 3),
                        fadeIn: true,
                        slidingBeginOffset: const Offset(0, 4),
                        child: CustomButton(
                          text: 'Sign In',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ),
                            );
                          },
                        height:screenSize.height*0.050,
                          width:screenSize.width*0.400,
                          fontSize:screenSize.height*0.015,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
     
    );
  }
}