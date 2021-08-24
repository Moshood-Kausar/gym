import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/style/colors.dart';

class AppName extends StatelessWidget {
  final Color? color;
  const AppName({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "ONE UP",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w900,
            fontSize: 40,
            color: color?? Colors.white,
          ),
        ),
        Text(
          "FITNESS",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color:color ?? Colors.white,
            letterSpacing: 5.5,
          ),
        ),
      ],
    );
  }
}

class RoundCircle extends StatelessWidget {
  const RoundCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: AppColor.mainColor,
    );
  }
}
