import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import 'package:pets/common/colors.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final double height;
  final double fontSize;
  final double width;
  final VoidCallback onTap;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.height,
      required this.width,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 100),
      onPressed: () {
        onTap();
      },
      
      child:  Container(
         width:width,
        height:height,
        alignment: Alignment.center,
        // ignore: sort_child_properties_last
        child: Text(
            text,
            style:  TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
          ),
         // border: Border.all(width: 2.0,color:Color.fromARGB(190, 22, 43, 72)),
        decoration: BoxDecoration(
           color: const Color.fromARGB(255, 0, 0, 0),
           borderRadius: BorderRadius.circular(15),
           boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 78, 78, 78),
                  blurRadius: 3,
                  
                  offset: Offset(1, 3)
                ),
              ],
        ),
       
       
       
),
       
        // child: Center(
        //   child: Text(
        //     text,
        //     style: const TextStyle(
        //         color: Color.fromARGB(217, 229, 228, 228),
        //         fontSize: 18,
        //         fontWeight: FontWeight.w600),
        //   ),
        // ),
      
    );
  }
}
class CustomButton2 extends StatelessWidget {
  final String text;
  final double height;
  final double fontSize;
  final double width;
  final VoidCallback onTap;
  const CustomButton2(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.height,
      required this.width,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 100),
      onPressed: () {
       onTap();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
             //gradient: GlobalVariables.appBarGradient1,
            color: GlobalVariables.secondaryColor,
            borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 62, 62, 62),
                  blurRadius: 1,
                  
                  offset: Offset(1, 2)
                ),
              ],
          // border: Border.all(color: GlobalVariables.secondaryColor,width: 2)
          
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color:  const Color.fromARGB(255, 255, 255, 255),
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
