import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:follow_fan/data/models/link_category_model.dart';
import 'package:follow_fan/ui/controllers/new_link_controller.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox({
    Key? key,
    required this.category,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);
  final LinkCategoryModel category;
  final bool isActive;
  final VoidCallback onPressed;

  final double boxSize = size.width * 0.25 - 15;

  final NewLinkController controller = Get.find<NewLinkController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxSize,
      height: boxSize,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                isActive ? kPrimaryLightColor : kPrimaryColor)),
        child: Stack(
          children: [
            Container(
              child: Center(
                child: SvgPicture.asset(
                  category.iconPath,
                  width: 40,
                ),
              ),
            ),
            Positioned(
                child: Visibility(
              visible: !isActive,
              child: Container(
                width: boxSize * 0.15,
                height: boxSize * 0.15,
                decoration: BoxDecoration(
                    color: kPrimaryDarkColor, shape: BoxShape.circle),
              ),
            )),
            Positioned(
              child: Visibility(
                visible: isActive,
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
