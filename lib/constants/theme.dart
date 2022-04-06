import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  static final blueDarkPrimaryColor = Color.fromARGB(255, 8, 135, 238);
  static final orangeDarkPrimaryColor = Colors.orange.shade900;

  static final blackThemePrimaryColor = Colors.black12;
  static final orangeTheme = ThemeData(
    //to change avator color according to  theme we use
    primaryColorDark: orangeDarkPrimaryColor,

    iconTheme: IconThemeData(color: orangeDarkPrimaryColor),
    sliderTheme: SliderThemeData(
       
inactiveTrackColor:orangeDarkPrimaryColor.withAlpha(100),


  activeTrackColor:orangeDarkPrimaryColor   ,thumbColor:orangeDarkPrimaryColor
    
    
    ),
    textTheme: TextTheme(

      
        titleSmall: TextStyle(color: Color.fromARGB(255, 209, 14, 46))),

        appBarTheme: AppBarTheme(backgroundColor: orangeDarkPrimaryColor),
    primaryColor: orangeDarkPrimaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: orangeDarkPrimaryColor,
    ),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: orangeDarkPrimaryColor),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      textStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
    )),
  );

  static final blueTheme = ThemeData(
    iconTheme: IconThemeData(color: blueDarkPrimaryColor),
    textTheme: TextTheme(titleSmall: TextStyle(color: blueDarkPrimaryColor)),
    primaryColor: blueDarkPrimaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: blueDarkPrimaryColor,
    ),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: blueDarkPrimaryColor),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      textStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
    )),
  );

  static final darkCustomTheme = ThemeData(

    
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      backgroundColor: Colors.black,
      textStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
    )),

    sliderTheme: SliderThemeData(
       
  activeTrackColor: Colors.cyan,

inactiveTrackColor: Colors.red   ,thumbColor: Colors.white
    
    
    ),

    dividerColor: Colors.green.shade700,
    brightness: Brightness.dark,

    textTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Color.fromARGB(255, 133, 245, 5))),
    primaryColor: blackThemePrimaryColor,

    // ),
  );
}
