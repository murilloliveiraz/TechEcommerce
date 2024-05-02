import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontApp(double size){
  return GoogleFonts.inter(
    fontSize: size,
    fontWeight: FontWeight.bold
  );
}

TextStyle fontAppWhite(double size){
  return GoogleFonts.inter(
    fontSize: size,
    fontWeight: FontWeight.bold,
    color: Colors.white
  );
}