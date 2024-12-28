
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pets/screens/homescreeen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

   int _page = 0;


  List<Widget> pages = [
    const HomeScreen(),
    //const UploadScreen(),z
    const Center(
    child: Text('search'),
  ),

    const Center(
    child: Text('upload '),
  ),
    const Center(
    child: Text('profile '),
  )
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: pages[_page],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 15,right: 15,top: 5),
        height: screenSize.height*0.09,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          color: Color.fromARGB(255, 255, 255, 255),
           boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 174, 170, 170),
                  blurRadius: 6,
                  
                  offset: Offset(0, 0.5)
                ),
              ],
            
        ),
        child: GNav(
       
        activeColor: Colors.white,
        tabBackgroundColor: Colors.black,
        padding: EdgeInsets.fromLTRB(13,13,13,13),
        
       tabMargin: EdgeInsets.fromLTRB(5, 10 ,5 ,10),
        iconSize:screenSize.height*0.04,
        
        gap: 6,
          tabs: [
            GButton(
        icon: Icons.home_outlined,
       
        text: 'Home',
        onPressed:(){
          updatePage(0);
        } ,
        
            ),
            GButton(
        icon: Icons.search,
        text: 'Likes',
         onPressed:(){
          updatePage(1);
        } ,
            ),
            GButton(
        icon: Icons.upload_outlined,
        text: 'upload',
         onPressed:(){
          updatePage(2);
        } ,
            ),
            GButton(
        icon: Icons.person_outline,
        text: 'Profile',
         onPressed:(){
          updatePage(3);
        } ,
            )
          ]
        ),
      )
    );
  }
}
