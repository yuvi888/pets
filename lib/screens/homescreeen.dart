import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pets/common/colors.dart';
import 'package:pets/screens/authscreen.dart';
 

// import 'package:pets/providers/user_provider.dart';
// import 'package:pets/services/auth_services.dart';
//import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // void signOutUser(BuildContext context) {
  //   AuthServices().signOut(context);
  // }
 Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserProvider>(context).user;
 Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      
      appBar:

      PreferredSize(
         preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.08), // Set the height of the app bar
        child: Container(
          margin: EdgeInsets.only(top: 30,right: 0 ,left: 10),
          color: Color.fromARGB(0, 255, 255, 255), // Set the background color of the app bar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child:  Lottie.asset(
                         'assets/hdog.json',   
                         fit: BoxFit.cover,  
                        ),
              ),
              Text(
          "pet's",
          style: GoogleFonts.pacifico(
            shadows: [
              const Shadow(
                  color: Color.fromARGB(197, 0, 0, 0),
                  offset: Offset(1, 1),
                  blurRadius: 8),
            ],
            fontSize: MediaQuery.of(context).size.height * 0.040,
            fontWeight: FontWeight.w200,
            color: GlobalVariables.blbackgroundColor,
          ),
        ),

        Container(
          child: MaterialButton(onPressed: () {
            _signOut(context);
          },
          child: Icon(Icons.outbox_rounded,size: MediaQuery.of(context).size.height * 0.03,),
          ),
        )
            ],
          ),
      ),),
      body: SingleChildScrollView(
        //mainAxisAlignment: MainAxisAlignment.center,
      child:  Column(
        
        children: [

          const SizedBox(height: 30),
          Column(
            children: [
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 20),
                
                 decoration: BoxDecoration(
 //boxShadow: [BoxShadow(color: Color.fromARGB(255, 30, 30, 30),offset: Offset(2, 2),blurRadius: 10)],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15))
                  
                  
                  ),
              ),
              
                Container(
                    height: 400,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        width: 4.0,
                      ),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      
                      child: Image.asset(
            'assets/karsten-winegeart-Qb7D1xw28Co-unsplash.jpg',
            // Replace with your image path
            fit: BoxFit.cover,
            height: double.infinity,
          ),
                    ),
                  
              ),

              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 20),
                
                 decoration: BoxDecoration(
 //boxShadow: [BoxShadow(color: Color.fromARGB(255, 30, 30, 30),offset: Offset(1, 1),blurRadius: 10)],
                  color: Color.fromARGB(255, 255, 255, 255),
                 
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15))
                  
                  
                  ),
              ),
            ],
          ),

          const SizedBox(height: 20),
            //  column1
           Column(
            children: [
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 20),
                
                 decoration: BoxDecoration(
 //boxShadow: [BoxShadow(color: Color.fromARGB(255, 30, 30, 30),offset: Offset(2, 2),blurRadius: 10)],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15))
                  
                  
                  ),
              ),
              
                Container(
                    height: 400,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        width: 4.0,
                      ),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      
                      child: Image.asset(
            'assets/karsten-winegeart-Qb7D1xw28Co-unsplash.jpg',
            // Replace with your image path
            fit: BoxFit.cover,
            height: double.infinity,
          ),
                    ),
                  
              ),

              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 20),
                
                 decoration: BoxDecoration(
 //boxShadow: [BoxShadow(color: Color.fromARGB(255, 30, 30, 30),offset: Offset(1, 1),blurRadius: 10)],
                  color: Color.fromARGB(255, 255, 255, 255),
                 // border: Border(top: BorderSide(color: GlobalVariables.secondaryColor,width: 0),bottom: BorderSide(color: GlobalVariables.secondaryColor,width: 2),right: BorderSide(color: GlobalVariables.secondaryColor,width: 2),left: BorderSide(color: GlobalVariables.secondaryColor,width: 2)),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15))
                  
                  
                  ),
              ),
            ],
          ),

          //column2
const SizedBox(height: 20),
          Column(
            children: [
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 20),
                
                 decoration: BoxDecoration(
 //boxShadow: [BoxShadow(color: Color.fromARGB(255, 30, 30, 30),offset: Offset(2, 2),blurRadius: 10)],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15))
                  
                  
                  ),
              ),
              
                Container(
                    height: 400,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        width: 4.0,
                      ),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      
                      child: Image.asset(
            'assets/karsten-winegeart-Qb7D1xw28Co-unsplash.jpg',
            // Replace with your image path
            fit: BoxFit.cover,
            height: double.infinity,
          ),
                    ),
                  
              ),

              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 20),
                
                 decoration: BoxDecoration(
 //boxShadow: [BoxShadow(color: Color.fromARGB(255, 30, 30, 30),offset: Offset(1, 1),blurRadius: 10)],
                  color: Color.fromARGB(255, 255, 255, 255),
                 // border: Border(top: BorderSide(color: GlobalVariables.secondaryColor,width: 0),bottom: BorderSide(color: GlobalVariables.secondaryColor,width: 2),right: BorderSide(color: GlobalVariables.secondaryColor,width: 2),left: BorderSide(color: GlobalVariables.secondaryColor,width: 2)),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15))
                  
                  
                  ),
              ),
            ],
          ),
            
          // ElevatedButton(
          //   onPressed: () => signOutUser(context),
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Colors.blue),
          //     textStyle: MaterialStateProperty.all(
          //       const TextStyle(color: Colors.white),
          //     ),
          //     minimumSize: MaterialStateProperty.all(
          //       Size(MediaQuery.of(context).size.width / 2.5, 50),
          //     ),
          //   ),
          //   child: const Text(
          //     "Sign Out",
          //     style: TextStyle(color: Colors.white, fontSize: 16),
          //   ),
          // ),
        ],
      ),
      ),
    );
  }
}
