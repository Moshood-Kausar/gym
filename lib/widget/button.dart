import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/style/exports.dart';

class MyAppButton extends StatelessWidget {
  final String txt;
  final void Function() onPressed;
  const MyAppButton({Key? key, required this.txt, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 40,
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: onPressed,
        child: Text(
          '$txt',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 15,
          ),
        ),
        color: AppColor.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }
}
