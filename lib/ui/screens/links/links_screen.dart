import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/controllers/links_controller.dart';
import 'package:follow_fan/ui/screens/links/components/link_box.dart';
import 'package:get/get.dart';

class LinksScreen extends StatefulWidget {
  LinksScreen({Key? key}) : super(key: key);

  @override
  State<LinksScreen> createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {
  final LinksController controller = Get.put(LinksController());

  @override
  initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await controller.getMyLinks();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LinksController>(builder: (_) {
      return MainLayout(
          onRefresh: () async {
            await _.getMyLinks();
          },
          body: Column(
            children: [
              Visibility(
                visible: _.links.length != 0,
                child: Column(
                  children: _.links
                      .map((link) => LinkBox(
                          link: link,
                          index: _.links.indexOf(link) + 1 < 10
                              ? "0${_.links.indexOf(link) + 1}"
                              : (_.links.indexOf(link) + 1).toString()))
                      .toList(),
                ),
              ),
              Visibility(
                visible: _.links.length == 0,
                child: Center(child: Text("لا يوجد روابط حاليا")),
              )
            ],
          ));
    });
  }
}
