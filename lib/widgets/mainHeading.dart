import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHeading extends StatelessWidget {
  const MainHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: screenSize.height / 10,
        bottom: screenSize.height / 15,
      ),
      width: screenSize.width,
      child: Text(
        'Knowledge diversity',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFFF735C),
            ),
      ),
    );
  }
}
