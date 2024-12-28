import 'dart:io';

import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pets/common/bottombar.dart';
import 'package:pets/common/colors.dart';
import 'package:pets/common/constant.dart';
import 'package:pets/common/custombutton.dart';
import 'package:pets/common/customfield.dart';
import 'package:pets/screens/homescreeen.dart';
import 'package:pets/screens/signinscreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets/services/authservices.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  File? _image;
 
  String? imageUrl;
  bool _isLoading=false;

  String? selectedValue;
  List<String> items = [
    'Kasrawad',
    'khargone',
    'indore',
    'Kasrawad1',
    'khargone1',
    'indore1',
    'Kasrawad2',
    'khargone2',
    'indore2',
    'Kasrawad3',
    'khargone3',
    'indore3',
    'Kasrawad4',
    'khargone4',
    'indore4',
    'Kasrawad5',
    'khargone5',
    'indore5',
  ];

    Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  final AuthService _authService = AuthService();

  Future<void> signUp() async {
    setState(() {
      _isLoading = true; // Show the progress indicator
    });

    User? user = await _authService.signUp(
      context: context,
      email: emailController.text,
      password: passwordController.text,
      username: usernameController.text,
      name: nameController.text,
      location: selectedValue ?? '',
      image: _image,
    );

    setState(() {
      _isLoading = false; // Hide the progress indicator
    });

    if (user != null) {
      
      showCustomAlertDialog(context,'User Successfully signed up!');
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBar(),
        ),
      );
    } else {
      //showCustomAlertDialog(context,'Sign up failed');
      // Show an error message to the user
    }
  }
  @override
  Widget build(BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: AppBar(
        backgroundColor: GlobalVariables.backgroundColor,
        toolbarHeight: 50,
        elevation: 0.0,
        scrolledUnderElevation: 0,
        leading: const BackButton(
         
          color: Color.fromARGB(255, 0, 0, 0), // <-- SEE HERE
        ),
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: TextStyle(
              fontSize:screenSize.height*0.025,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                _image != null
                    ? Container(
                       height:screenSize.height*0.190,
                        width:screenSize.height*0.150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                          border: Border.all(
                            color: GlobalVariables.blbackgroundColor,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            //    height: 190,
                            // width: 160,
                          ),
                        ),
                      )
                    : Container(
                       height:screenSize.height*0.190,
                        width:screenSize.height*0.150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                          border: Border.all(
                            color: GlobalVariables.blbackgroundColor,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/rocky.jpg', // Use the File
                            fit: BoxFit.cover,
                            //    height: 190,
                            // width: 160,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                DelayedDisplay(
                  delay: Duration(seconds: 1),
                  fadeIn: true,
                  slidingBeginOffset: Offset(0, -2),
                
                                  
                                  child:  CustomButton(text: 'Profile Pic', onTap: (){
                                    _pickImage();
                                  },  
                        height:screenSize.height*0.040,
                              width:screenSize.width*0.300,
                              fontSize:screenSize.height*0.013,
                        )),
                
                const SizedBox(
                  height: 20,
                ),
                DelayedDisplay(
                  delay: Duration(seconds: 1),
                  fadeIn: true,
                  slidingBeginOffset: Offset(-1, 0),
                  child: CustomTextField(
                    controller: usernameController,
                    hintText: 'Enter your username',
                  ),
                ),
                DelayedDisplay(
                  delay: Duration(seconds: 1),
                  fadeIn: true,
                  slidingBeginOffset: Offset(-1, 0),
                  child: CustomTextField(
                    controller: nameController,
                    hintText: 'Enter your name',
                  ),
                ),
                DelayedDisplay(
                  delay: Duration(seconds: 1),
                  fadeIn: true,
                  slidingBeginOffset: Offset(1, 0),
                  child: CustomTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                  ),
                ),
                DelayedDisplay(
                  delay: Duration(seconds: 1),
                  fadeIn: true,
                  slidingBeginOffset: Offset(-1, 0),
                  child: CustomTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                  ),
                ),
                DelayedDisplay(
                
                  delay: Duration(seconds: 1),
                  fadeIn: true,
                  slidingBeginOffset: Offset(1, 0),
                  child: DropdownButtonHideUnderline(
                    child: Container(
                      height: 45,
                      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                        //     color: Color.fromARGB(196, 109, 109, 109), width: 1),
                      ),
                      child: DropdownButton(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        dropdownColor: Color.fromARGB(224, 255, 255, 255),
                        hint: Text(
                          ' Location near you',
                          style: TextStyle(
                              fontSize: 12,
                              color:Color.fromARGB(234, 104, 102, 102)),
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
          
                        // itemHeight: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                DelayedDisplay(
                                  delay: const Duration(seconds: 1),
                                  fadeIn: true,
                                  slidingBeginOffset: const Offset(0, 1),
                                  child:  CustomButton(text: 'Sign Up', onTap: (){
                                    signUp();
                                  },     height:screenSize.height*0.047,
                              width:screenSize.width*0.350,
                              fontSize:screenSize.height*0.015,)),
                SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign In ?',
                    style: TextStyle(
                      color: GlobalVariables.blbackgroundColor,fontSize: 15
                    ),
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