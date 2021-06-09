import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:covaid/Utils/glintUI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            bottom: getFormFactor(context) == ScreenSize.Mobile
                ? -GlintUI.shortestSide(context) * 0.2
                : -132.0,
            right: 20.0,
            child: Image.asset(
              'assets/images/homeScreenImage.png',
              width: Get.width * 0.43,
            ),
          ),
          Positioned(
            top: -Get.height * .3,
            right: -Get.width * 0.25,
            child: Image.asset(
              'assets/images/bgRing.png',
              width: Get.width * 0.36,
            ),
          ),
          Positioned(
            bottom: -Get.height * .3,
            left: -Get.width * 0.01,
            child: Image.asset(
              'assets/images/bgRing.png',
              width: Get.width * 0.28,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 30.0,
                            ),
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
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Oxygen cylinder in Delhi',
                                hintStyle: TextStyle(
                                  color: GlintUI.covaidGrey[1],
                                  fontSize: Get.width * 0.012,
                                  fontWeight: FontWeight.w900,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.search,
                                    color: GlintUI.covaidPurple,
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                color: GlintUI.covaidGrey[1],
                                fontSize: Get.width * 0.012,
                                fontWeight: FontWeight.w900,
                              ),
                              onSubmitted: (query) {},
                            ),
                          ),
                          Container(
                            width: 120,
                            color: GlintUI.covaidGrey[0],
                          ),
                        ],
                      ),
                      SizedBox(height: 60.0),
                      Text(
                        'Let\'s fight COVID-19\ntogether',
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
                        'Help others by sharing the leads about\ngas cylinders, plasma donataors, hospital beds\nor any other corona related comodity.',
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
                        onPressed: () {
                          Navigator.pushNamed(context, '/aid');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 45.0,
                            vertical: 13.0,
                          ),
                          child: Center(
                            child: Text(
                              'Post Aid',
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
                        height: 60.0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
