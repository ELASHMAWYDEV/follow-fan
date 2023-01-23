import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:follow_fan/utils/constants.dart';

class CheckboxButton extends StatelessWidget {
  const CheckboxButton(
      {Key? key,
      required this.isActive,
      this.svgImagePath,
      this.imagePath,
      this.imageUrl,
      this.title,
      required this.onChange})
      : super(key: key);
  final bool isActive;
  final String? svgImagePath;
  final String? imagePath;
  final String? imageUrl;
  final String? title;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onChange,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              isActive ? kPrimaryLightColor : kWhiteColor),
          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          )),
        ),
        child: Stack(
          children: [
            Container(
              width: size.width * 0.3,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: isActive ? kPrimaryDarkColor : kGrayColor,
                  ),
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  if (svgImagePath != null)
                    SvgPicture.asset(
                      imagePath ?? "",
                      width: size.width * 0.25,
                      height: size.width * 0.3,
                    ),
                  if (imagePath != null)
                    Image.asset(
                      imagePath ?? "",
                      width: size.width * 0.25,
                      height: size.width * 0.3,
                    ),
                  if (imageUrl != null)
                    Image.network(
                      imagePath ?? "",
                      width: size.width * 0.25,
                      height: size.width * 0.3,
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  if (title != null)
                    Text(
                      title ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isActive ? kPrimaryDarkColor : kGrayColor),
                    )
                ],
              ),
            ),
            Positioned(
                top: 10,
                right: 10,
                child: Visibility(
                  visible: !isActive,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: kPrimaryDarkColor, shape: BoxShape.circle),
                  ),
                )),
            Positioned(
              top: 10,
              right: 10,
              child: Visibility(
                visible: isActive,
                child: SvgPicture.asset(
                  "assets/images/check-mark.svg",
                  width: 15,
                ),
              ),
            )
          ],
        ));
  }
}
