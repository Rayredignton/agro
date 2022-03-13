import 'package:agro/screens/orders.dart';
import 'package:agro/screens/outlet.dart';
import 'package:agro/screens/sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'assets.dart';
import 'homeScreen.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

int position = 2;

  navigateToPage(int index) {
    setState(() {
      position = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Outlet(),
    Orders(),
    Profile(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: _widgetOptions.elementAt(position),


        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: HexColor("#D2D7D3"),

          currentIndex: position,
          onTap: (index) {
            navigateToPage(index);
          },
          selectedFontSize: 20.sp,
          //  fixedColor: HexColor("#1E791C"),
          unselectedFontSize: 14.sp,
          type: BottomNavigationBarType.shifting,
          //fixedColor: Colors.white,
          selectedItemColor: HexColor("#1E791C"),
          selectedLabelStyle: TextStyle(
              fontFamily: "Lato",
              fontWeight: FontWeight.w400,
              color: HexColor("#1E791C")),
          unselectedLabelStyle: TextStyle(
              fontFamily: "Lato",
              fontWeight: FontWeight.w400,
              color: HexColor("#A5AFA7")),
          showUnselectedLabels: true,
          iconSize: 20.sp,

          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.a),
              label: "Home",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.b),
              label: "Outlet",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.c),
              label: "Sales",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.d),
              label: "Profile",
              backgroundColor: Colors.white,
            ),
          ],
        ),
      
    );
  }
}