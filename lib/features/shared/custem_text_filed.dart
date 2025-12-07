import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_inter_face_2/core/constants/app_colos.dart';

class CustemTextFiled extends StatefulWidget {
  CustemTextFiled({
    required this.hintText,
    required this.controller,
    this.isPassowrd = false,
  });
  final String hintText;
  final TextEditingController controller;
  bool isPassowrd;

  @override
  State<CustemTextFiled> createState() => _CustemTextFiledState();
}

class _CustemTextFiledState extends State<CustemTextFiled> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.isPassowrd;
    super.initState();
  }

  void TogelPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please fill";
        }
        {
          null;
        }
      },
      controller: widget.controller,
      obscureText: widget.isPassowrd,

      cursorHeight: 20,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.black),
        suffixIcon: widget.isPassowrd
            ? GestureDetector(
                onTap: TogelPassword,
                child: Icon(CupertinoIcons.eye),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
      ),
    );
  }
}
