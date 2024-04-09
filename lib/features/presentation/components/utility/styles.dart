import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dimensions.dart';

final robotoRegular = TextStyle(
  fontFamily: 'NotoSerif',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoMedium = TextStyle(
  fontFamily: 'NotoSerif',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoBold = TextStyle(
  fontFamily: 'NotoSerif',
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoBlack = TextStyle(
  fontFamily: 'NotoSerif',
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeDefault,
);
final  styleTitle = GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w800,color: Colors.red);
final styleSubTitle = GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.black);
final styleContent = TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade800);
final styleSubContent =  GoogleFonts.roboto(fontWeight: FontWeight.w500,color: Colors.grey.shade600);
final styleItalic = GoogleFonts.roboto(fontWeight: FontWeight.w700,fontStyle: FontStyle.italic);
final styleItalicContent = GoogleFonts.roboto(fontWeight: FontWeight.w400,fontStyle: FontStyle.italic);
TextStyle labelStyle = GoogleFonts.nunitoSans(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 12);
