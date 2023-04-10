//import 'package:firstapp/vendorreg.dart';
import 'package:flutter/material.dart';
//import 'bottomnav.dart';
import 'bottomnav.dart';
// import 'login_screen.dart';
// import 'registerasuser.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.deepOrange,
      //   scaffoldBackgroundColor: const Color(0xffF8F9FA),

      //   appBarTheme: const  AppBarTheme(
      //       elevation: 0,
      //       iconTheme: IconThemeData(
      //           color: Colors.black
      //       ),
      //       backgroundColor:  Color(0xffF8F9FA) ,
      //       titleTextStyle:  TextStyle(
      //           fontSize: 18, color: Colors.deepOrange,
      //           fontFamily: 'Avenir Heavy')
      //   ),
      //   fontFamily: 'SF_Pro_Display',
      
      // ),
      //
      home:  BNav(),
      //home: VendorRegistration(),
      //home: RegAsUser(),
    );
  }
}