import 'package:flutter/material.dart';
import 'package:portlends/screens/sub_screens/categories_screen.dart';
import 'package:portlends/screens/main_screens/main_screen.dart';
import 'package:portlends/screens/sub_screens/products_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromRGBO(245, 245, 245, 1),
          onPrimary: Color.fromRGBO(45, 12, 87, 1),
          secondary: Color.fromRGBO(11, 206, 131, 1),
          onSecondary: Color.fromRGBO(245, 245, 245, 1),
          primaryVariant: Color.fromRGBO(11, 206, 131, 1),
          secondaryVariant: Color.fromRGBO(226, 203, 255, 1),
          surface: Color.fromRGBO(255, 255, 255, 1),
          onSurface: Color.fromRGBO(45, 12, 87, 1),
          background: Color.fromRGBO(245, 245, 245, 1),
          onBackground: Color.fromRGBO(45, 12, 87, 1),
          error: Colors.red,
          onError: Color.fromRGBO(255, 255, 255, 1),
        ),
        primaryColor: Color.fromRGBO(11, 206, 131, 1),
        accentColor: Color.fromRGBO(45, 12, 87, 1),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color.fromRGBO(114, 3, 255, 1),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Color.fromRGBO(45, 12, 87, 1),
            fontSize: 18,
            fontFamily: 'SF-PRO',
          ),
          bodyText2: TextStyle(
            fontSize: 15,
            fontFamily: 'SF-PRO',
          ),
          headline1: TextStyle(
            color: Color.fromRGBO(45, 12, 87, 1),
            fontSize: 32,
            fontFamily: 'SF-PRO',
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
            color: Color.fromRGBO(45, 12, 87, 1),
            fontSize: 27,
            fontFamily: 'SF-PRO',
            fontWeight: FontWeight.w700,
          ),
          headline3: TextStyle(
            color: Color.fromRGBO(45, 12, 87, 1),
            fontSize: 22,
            fontFamily: 'SF-PRO',
            fontWeight: FontWeight.w700,
          ),
          headline4: TextStyle(
            color: Color.fromRGBO(45, 12, 87, 1),
            fontSize: 15,
            fontFamily: 'SF-PRO',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/produtos': (context) => ProductsScreen(),
      },
    ),
  );
}
