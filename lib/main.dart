import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/screens/search_results_screen.dart';
import 'package:travel_app/util/color_constants.dart';
import 'package:travel_app/util/strings.dart';

import 'screens/flights_search_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: const FlightSearchScreen(),
  ));
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorConstants.statusBarColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}









