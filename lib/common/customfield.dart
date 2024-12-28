import 'package:flutter/material.dart';
import 'package:pets/common/colors.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return  Container(
            //  padding: EdgeInsets.only(left: 20.0, right: 10.0),
               height: screenSize.height*0.055,
              margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              decoration: BoxDecoration(
 //boxShadow: [BoxShadow(color: const Color.fromARGB(255, 0, 0, 0),offset: Offset(0.1, 0.1),blurRadius: 5)],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10)
                  
                  
                  ),
              child: TextField(
                
                
                
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                cursorColor: GlobalVariables.blbackgroundColor,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 6.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color:  GlobalVariables.blbackgroundColor,width: 1.5,),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(196, 255, 255, 255),width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(234, 104, 102, 102),
                        fontSize: 12)),
                controller: controller,
                // onChanged: (value) {
                //   //addMessage(false);
                // },
              ),
            );
  }
}