import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:covaid/Utils/glintUI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetAidSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: Get.height * .25,
            left: -Get.width * 0.1,
            child: Image.network(
              'assets/images/bgRing.png',
              width: Get.width * 0.28,
            ),
          ),
          Positioned(
            right: 120.0,
            bottom: -100.0,
            child: Image.network(
              'assets/images/section3Image.png',
              width: Get.width * 0.35,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                SizedBox(
                  width: 90.0,
                ),
                Image.network(
                  'assets/images/postsDisplay.png',
                  width: Get.width * 0.4,
                ),
              ],
            ),
          ),
          Positioned(
            top: -Get.height * .65,
            right: -Get.width * 0.15,
            child: Image.network(
              'assets/images/bgRing.png',
              width: Get.width * 0.36,
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
                      Text(
                        'Get verifiedand real-time\nupdating posts',
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
                        'You will only see authentic posts and with the\nstatus of stock and real-time situation with all\nneccessary information.',
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
                              'Get Aid',
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
                        height: 160.0,
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
