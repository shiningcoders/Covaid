import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:covaid/Controllers/trackerDataController.dart';
import 'package:covaid/Utils/glintUI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TrackerDataController _trackerDataController =
        Get.put(TrackerDataController());
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.white,
      child: Stack(
        children: [
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: Image.asset(
          //     'images/blueMesh.png',
          //     width: Get.width * 0.28,
          //   ),
          // ),
          Positioned(
            bottom: 0.0,
            left: Get.width * 0.1,
            child: Image.network(
              'assets/images/section2Image.png',
              width: Get.width * 0.3,
            ),
          ),
          Positioned(
            bottom: -Get.height * .12,
            right: -Get.width * 0.15,
            child: Image.network(
              'assets/images/bgRing.png',
              width: Get.width * 0.36,
            ),
          ),
          Positioned(
            top: -Get.height * .3,
            left: -Get.width * 0.01,
            child: Image.network(
              'assets/images/bgRing.png',
              width: Get.width * 0.28,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 30.0,
                        ),
                        height: Get.width * 0.08,
                        width: Get.width * 0.7,
                        decoration: BoxDecoration(
                          color: Color(0xfff5f5f5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          border: Border.all(
                            color: GlintUI.covaidGrey[0],
                            width: 5.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() => Text(
                                          _trackerDataController.cases.value,
                                          style: TextStyle(
                                            color: GlintUI.covaidPurple,
                                            fontSize: Get.width * 0.025,
                                            fontWeight: FontWeight.w900,
                                            height: 1.1,
                                          ),
                                        )),
                                    Text(
                                      'Total Cases',
                                      style: TextStyle(
                                        color: GlintUI.covaidGrey[1],
                                        fontSize: Get.width * 0.012,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 3.0,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() => Text(
                                          _trackerDataController.recovery.value,
                                          style: TextStyle(
                                            color: Color(0xff5fc211),
                                            fontSize: Get.width * 0.025,
                                            fontWeight: FontWeight.w900,
                                            height: 1.1,
                                          ),
                                        )),
                                    Text(
                                      'Total Recovery',
                                      style: TextStyle(
                                        color: GlintUI.covaidGrey[1],
                                        fontSize: Get.width * 0.012,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 3.0,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() => Text(
                                          _trackerDataController.deaths.value,
                                          style: TextStyle(
                                            color: Color(0xfff65555),
                                            fontSize: Get.width * 0.025,
                                            fontWeight: FontWeight.w900,
                                            height: 1.1,
                                          ),
                                        )),
                                    Text(
                                      'Total Deaths',
                                      style: TextStyle(
                                        color: GlintUI.covaidGrey[1],
                                        fontSize: Get.width * 0.012,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60.0),
                      Text(
                        'Follow COVID-19\nGuidelines',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: GlintUI.covaidGrey[3],
                          fontSize: Get.width * 0.025,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Stop the spread of this deadly disease.\nFollow the guidelines issued by WHO to win\nthe battle over corona virus.',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: GlintUI.covaidGrey[1],
                          fontSize: Get.width * 0.015,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      BouncingWidget(
                        scaleFactor: 0.5,
                        duration: Duration(
                          milliseconds: 100,
                        ),
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 45.0,
                            vertical: 13.0,
                          ),
                          child: Center(
                            child: Text(
                              'Read More',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: GlintUI.wheezGrey[0],
                                fontSize: Get.width * 0.013,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: GlintUI.covaidPurple,
                            boxShadow: [
                              BoxShadow(
                                color: GlintUI.covaidPurple.withOpacity(0.2),
                                blurRadius: 6.0,
                                offset: Offset(0.0, 6.0),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 150.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
