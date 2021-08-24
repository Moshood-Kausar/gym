import 'package:flutter/material.dart';
import 'package:gym/style/colors.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? icon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? secure;
  final IconData? suffixIcon;
  final String? label, hintText;
  const AppTextFormField(
      {Key? key,
      this.controller,
      this.validator,
      this.icon,
      this.keyboardType,
      this.secure,
      this.label,
      this.hintText,
      this.suffixIcon,
      this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.grey.shade300,
            blurRadius: 10,
          )
        ],
      ),
      child: TextFormField(
        cursorColor: AppColor.mainColor,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        cursorHeight: 25,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        obscureText: secure!,
        style: TextStyle(
          color: AppColor.mainColor,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          fillColor: AppColor.white,
          errorStyle: TextStyle(
            color: AppColor.mainColor,
            fontWeight: FontWeight.w900,
          ),
          filled: true,
          isDense: true,
          suffixIcon: icon ?? Icon(suffixIcon, size: 24),
          labelText: label,
          hintText: hintText,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: AppColor.white, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: AppColor.mainColor, width: 2.0),
          ),
        ),
      ),
    );
  }
}
