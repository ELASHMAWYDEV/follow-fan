import 'package:flutter/material.dart';
import 'package:follow_fan/data/models/link_type_model.dart';
import 'package:follow_fan/utils/constants.dart';

class SubTypeButton extends StatelessWidget {
  const SubTypeButton(
      {Key? key,
      required this.type,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);

  final LinkTypeModel type;
  final bool isSelected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
          onPressed: type.isActive ? onPressed : null,
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 4, horizontal: 20)),
              backgroundColor: MaterialStateProperty.all(!type.isActive
                  ? kGrayColor
                  : isSelected
                      ? kPrimaryLightColor
                      : kPrimaryColor)),
          child: Center(
            child: Text(
              type.title,
              style: TextStyle(
                color: isSelected ? kWhiteColor : kPrimaryLightColor,
              ),
            ),
          )),
    );
  }
}
