import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.large = false,
  }) : super(key: key);

  final String label;
  final bool large;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        maxLines: large ? 3 : 1,
        controller: controller,
        keyboardType: keyboardType,
        autofocus: false,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
            color: kGrayColor,
          ),
          isDense: true,
          fillColor: kWhiteColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8)),
          focusColor: kPrimaryColor,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
