import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CGITaskFonts {
  // Regular Fonts
  static final TextStyle regularFonts12 = GoogleFonts.raleway(
      color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500);

  static final TextStyle regularFonts14 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500);

  static final TextStyle buttonRegularFonts12 = GoogleFonts.raleway(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      shadows: <Shadow>[
        Shadow(
          offset: const Offset(-1, 1),
          blurRadius: 1.0,
          color: Colors.black.withOpacity(0.5),
        ),
      ]);

  static final TextStyle hintRegularFonts14 = GoogleFonts.raleway(
      color: Colors.grey,
      fontSize: 14,
      fontWeight: FontWeight.w500
  );

  static final TextStyle buttonRegularFonts15 = GoogleFonts.raleway(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      shadows: <Shadow>[
        Shadow(
          offset: const Offset(-1, 1),
          blurRadius: 1.0,
          color: Colors.black.withOpacity(0.5),
        ),
      ]);

  static final TextStyle regularRedFonts18 = GoogleFonts.raleway(
      color: Colors.red, fontSize: 18, fontWeight: FontWeight.w500);

  static final TextStyle regularGreyFonts18 = GoogleFonts.raleway(
      color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500);

  static final TextStyle regularFonts18 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);

  static final TextStyle regularRedFonts20 = GoogleFonts.raleway(
      color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500);

  static final TextStyle regularGreyFonts20 = GoogleFonts.raleway(
      color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500);

  static final TextStyle regularFonts20 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);

  // SemiBold Fonts
  static final TextStyle semiBoldFonts16 = GoogleFonts.raleway(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);

  static final TextStyle semiBoldFonts18 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600);

  static final TextStyle semiBoldFonts20 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);

  static final TextStyle semiBoldFonts22 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700);

  static final TextStyle semiBoldFonts24 = GoogleFonts.raleway(
      color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600);

  static final TextStyle semiBoldFonts35 = GoogleFonts.raleway(
      color: Colors.white.withOpacity(0.1),
      fontSize: 35,
      fontWeight: FontWeight.w700);

  // Bold Fonts
  static final TextStyle boldFonts35 = GoogleFonts.raleway(
    color: Colors.black,
    fontSize: 35,
    fontWeight: FontWeight.w700,
    shadows: <Shadow>[
      Shadow(
        offset: const Offset(2.0, 2.0),
        blurRadius: 3.0,
        color: Colors.black.withOpacity(0.5),
      ),
    ],
  );

  // Error Fonts
  static final TextStyle errorFonts = GoogleFonts.raleway(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);
}
