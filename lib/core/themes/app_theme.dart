import 'package:flutter/material.dart';
import 'package:giphy_flutter_app/core/constants/color_constants.dart';
import 'package:giphy_flutter_app/core/constants/style_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      textTheme: TextTheme(
        bodyText1: GoogleFonts.poppins(
          color: kWhite,
          fontWeight: FontWeight.w300,
          fontSize: kDimens18
        ),
        bodyText2: GoogleFonts.poppins(
            color: kGray,
            fontWeight: FontWeight.w300,
            fontSize: kDimens18
        ),
      )
    );
  }
}