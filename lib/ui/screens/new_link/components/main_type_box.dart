import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:follow_fan/data/models/link_type_model.dart';
import 'package:follow_fan/ui/controllers/links_controller.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';

class MainTypeBox extends StatelessWidget {
  MainTypeBox({
    Key? key,
    required this.type,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);
  final LinkTypeModel type;
  final bool isSelected;
  final VoidCallback onPressed;

  final double boxSize = size.width * 0.25 - 15;

  final LinksController controller = Get.find<LinksController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxSize,
      height: boxSize,
      child: TextButton(
        onPressed: type.isActive ? onPressed : null,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(!type.isActive
                ? kGrayColor
                : isSelected
                    ? kPrimaryLightColor
                    : kPrimaryColor)),
        child: Stack(
          children: [
            Container(
              child: Center(
                child: SvgPicture.string(
                  type.svgCode ?? "",
                  color: kWhiteColor,
                  width: 40,
                ),
              ),
            ),
            Positioned(
                child: Visibility(
              visible: !isSelected,
              child: Container(
                width: boxSize * 0.15,
                height: boxSize * 0.15,
                decoration: BoxDecoration(
                    color: kPrimaryDarkColor, shape: BoxShape.circle),
              ),
            )),
            Positioned(
              child: Visibility(
                visible: isSelected,
                child: SvgPicture.asset(
                  "assets/images/check-mark.svg",
                  width: boxSize * 0.15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
