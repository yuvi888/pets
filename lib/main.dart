import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pets/Screens/authscreen.dart';
import 'package:pets/screens/splashscreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       //home:  Provider.of<UserProvider>(context).user.token.isEmpty ? const AuthScreen() : const BottomBar(),
      home: const SplashScreen(),
    );
  }
}


