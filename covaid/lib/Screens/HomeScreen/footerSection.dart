import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:covaid/Utils/glintUI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.9,
      width: Get.width,
      color: Colors.white,
      child: Expanded(
        child: Container(
          width: Get.width,
          color: GlintUI.covaidPink,
          padding: EdgeInsets.symmetric(
            horizontal: 120.0,
            vertical: 60.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Us',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: GlintUI.covaidGrey[3],
                  fontSize: Get.width * 0.018,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Full Name',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: GlintUI.covaidGrey[2],
                            fontSize: Get.width * 0.0105,
                            fontWeight: FontWeight.w900,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 20.0,
                          ),
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
                              hintText: 'Your Name',
                              hintStyle: TextStyle(
                                color: GlintUI.covaidGrey[1],
                                fontSize: Get.width * 0.012,
                                fontWeight: FontWeight.w900,
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
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Email Address',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: GlintUI.covaidGrey[2],
                            fontSize: Get.width * 0.0105,
                            fontWeight: FontWeight.w900,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 20.0,
                          ),
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
                              hintText: 'yourusername@gmail.com',
                              hintStyle: TextStyle(
                                color: GlintUI.covaidGrey[1],
                                fontSize: Get.width * 0.012,
                                fontWeight: FontWeight.w900,
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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Message',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: GlintUI.covaidGrey[2],
                            fontSize: Get.width * 0.0105,
                            fontWeight: FontWeight.w900,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 15.0,
                          ),
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
                            maxLines: 7,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type your message...',
                              hintStyle: TextStyle(
                                color: GlintUI.covaidGrey[1],
                                fontSize: Get.width * 0.012,
                                fontWeight: FontWeight.w900,
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
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
                  width: 160.0,
                  child: Center(
                    child: Text(
                      'Send',
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
              Spacer(),
              Text(
                'Contributors',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: GlintUI.covaidGrey[3],
                  fontSize: Get.width * 0.015,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BouncingWidget(
                    onPressed: () {
                      // // js.context.callMethod(
                      // //     'open', ['https://github.com/CoderShubham2000']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/49725333?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // // js.context.callMethod(
                      // //     'open', ['https://github.com/rashiagrawal21']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/62902189?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // // js.context.callMethod(
                      // //     'open', ['https://github.com/jaydip1235']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/65560026?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // js.context.callMethod(
                      // 'open', ['https://github.com/rishav9713']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/39820543?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // js.context.callMethod(
                      // 'open', ['https://github.com/Ashish1322']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/69026067?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // js.context
                      // .callMethod('open', ['https://github.com/jainj2305']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/53536106?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // js.context.callMethod(
                      // 'open', ['https://github.com/riyasinghal20']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/64135831?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // js.context.callMethod(
                      // 'open', ['https://github.com/thecreatorsir']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/56694038?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // js.context.callMethod(
                      // 'open', ['https://github.com/diyaagrawal15']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/83470905?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // js.context.callMethod(
                      // 'open', ['https://github.com/Kajal-Mishra01']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/82231504?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // js.context.callMethod(
                      // 'open', ['https://github.com/SanyamGoyal401']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/77378294?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // js.context
                      // .callMethod('open', ['https://github.com/aakhya1']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/49240130?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // js.context
                      // .callMethod('open', ['https://github.com/techtarun']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/40317745?v=4',
                      ),
                    ),
                  ),
                  BouncingWidget(
                    onPressed: () {
                      // js.context.callMethod(
                      // 'open', ['https://github.com/AjayrajSingh']);
                    },
                    child: CircleAvatar(
                      backgroundColor: GlintUI.covaidGrey[0],
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/30977789?v=4',
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'A Shining Coders initiative',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: GlintUI.covaidGrey[2],
                      fontSize: Get.width * 0.012,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                    ),
                  ),
                  Text(
                    'github.com/shiningcoders/Covaid',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: GlintUI.covaidGrey[2],
                      fontSize: Get.width * 0.012,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
