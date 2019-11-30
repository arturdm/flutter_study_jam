import 'package:flutter/material.dart';

import 'supplemental/cut_corners_border.dart';

const shrinePink50 = const Color(0xFFFEEAE6);
const shrinePink100 = const Color(0xFFF8F0A4);
const shrinePink300 = const Color(0xFFF9C696);
const shrinePink400 = const Color(0xFFD8A458);

const shrineBrown900 = const Color(0xFF442B2D);

const shrineErrorRed = const Color(0xFFC5032B);

const shrineSurfaceWhite = const Color(0xFFFFFBFA);
const shrineBackgroundWhite = Colors.white;

const shrinePurple = Color(0xFF5D1049);
const shrineBlack = Color(0xFF000000);

ThemeData createTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: shrineBrown900,
      primaryColor: shrinePink100,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: shrinePink100,
        textTheme: ButtonTextTheme.normal,
      ),
      scaffoldBackgroundColor: shrineSurfaceWhite,
      cardColor: shrineBackgroundWhite,
      textSelectionColor: shrinePink100,
      errorColor: shrineErrorRed,
      textTheme: _createTextTheme(base.textTheme),
      primaryTextTheme: _createTextTheme(base.primaryTextTheme),
      accentTextTheme: _createTextTheme(base.accentTextTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: shrineBrown900),
      inputDecorationTheme: InputDecorationTheme(
        border: CutCornersBorder()
      )
      // TODO: Add the text themes (103)
      // TODO: Add the icon themes (103)
      // TODO: Decorate the inputs (103)
      );
}

TextTheme _createTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: "Rubik",
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}
