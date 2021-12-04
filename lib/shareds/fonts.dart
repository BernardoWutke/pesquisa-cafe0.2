import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:pesquisa_cafe_02/shareds/colors.dart';

class AppFonts {
  static TextStyle titleHome = GoogleFonts.nunitoSans(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.colorTitleHOme);
  static TextStyle titlePraga = GoogleFonts.nunitoSans(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      color: AppColors.colorTitleHOme);

  static TextStyle titleMenusHome = GoogleFonts.nunitoSans(
      fontSize: 22,
      fontWeight: FontWeight.w300,
      color: AppColors.colorTitleHOme);
  static TextStyle titleTileBusca = GoogleFonts.nunitoSans(
      fontSize: 22,
      fontWeight: FontWeight.w300,
      color: AppColors.colorTitleHOme);

  static TextStyle titleSobrePraga = GoogleFonts.nunitoSans(
      fontSize: 22,
      fontWeight: FontWeight.w800,
      color: AppColors.colorTitleMenuPrimaryHome);

  static TextStyle sobrePraga = GoogleFonts.nunitoSans(
    fontSize: 19,
    fontWeight: FontWeight.w300,
    color: AppColors.colorTitleHOme,
  );
}
