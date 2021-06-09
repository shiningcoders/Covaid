import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covaid/Utils/glintUI.dart';
import 'package:covaid/Widgets/filterSelector.dart';
import 'package:covaid/Widgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class AidScreen extends StatelessWidget {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    aidCard(DocumentSnapshot data) {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color(0xfffff6a1),
            ),
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Color(0xffffd283),
                                  backgroundImage:
                                      NetworkImage('${data['photoURL']}'),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${data['name']}",
                                  style: TextStyle(
                                    color: GlintUI.covaidGrey[3],
                                    fontSize: Get.width * 0.015,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  '${data['aid']}',
                                  style: TextStyle(
                                    color: GlintUI.covaidGrey[2],
                                    fontSize: Get.width * 0.01,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '${data['description']}',
                                        style: TextStyle(
                                          color: GlintUI.covaidGrey[1],
                                          fontSize: Get.width * 0.01,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                Text(
                                  '₹ ${data['rate']}/${data['unit']}',
                                  style: TextStyle(
                                    color: GlintUI.covaidGrey[2],
                                    fontSize: Get.width * 0.016,
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
                ),
                Row(
                  children: [
                    Text(
                      '${data['stock']} left in stock',
                      style: TextStyle(
                        color: GlintUI.covaidGrey[2],
                        fontSize: Get.width * 0.01,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      '${timeago.format(data['time'].toDate())}',
                      style: TextStyle(
                        color: GlintUI.covaidGrey[1],
                        fontSize: Get.width * 0.01,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 160,
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.call,
                      color: GlintUI.covaidGrey[2],
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.location_pin,
                      color: GlintUI.covaidGrey[2],
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: GlintUI.covaidGrey[2],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xffffd283),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0.0),
                  topLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(25.0),
                  bottomLeft: Radius.circular(0.0),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -Get.height * .3,
            right: -Get.width * 0.2,
            child: Image.network(
              'assets/images/bgRing.png',
              width: Get.width * 0.36,
            ),
          ),
          Positioned(
            bottom: -Get.height * .25,
            left: -Get.width * 0.01,
            child: Image.network(
              'assets/images/bgRing.png',
              width: Get.width * 0.28,
            ),
          ),
          Scrollbar(
            controller: _scrollController,
            isAlwaysShown: true,
            thickness: 6.0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
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
                            child: Row(
                              children: [
                                Text(
                                  'Post Aid',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: GlintUI.wheezGrey[0],
                                    fontSize: Get.width * 0.013,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ],
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
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120.0,
                      ),
                      Text(
                        'Filters',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                          color: GlintUI.covaidGrey[2],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  FilterSelector(),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                      ),
                      Text(
                        'Results',
                        style: TextStyle(
                          color: GlintUI.covaidGrey[3],
                          fontSize: Get.width * 0.02,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 120.0,
                    ),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('aid')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 50.0,
                              mainAxisSpacing: 40.0,
                              childAspectRatio: 2,
                            ),
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              return aidCard(snapshot.data.docs[index]);
                            },
                          );
                        } else if (snapshot.data.docs.length == 0) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'No results found for this query at the moment!',
                                    style: TextStyle(
                                      color: GlintUI.covaidGrey[3],
                                      fontSize: Get.width * 0.02,
                                      fontWeight: FontWeight.w900,
                                      height: 1.1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'No results found for this query at the moment!',
                                    style: TextStyle(
                                      color: GlintUI.covaidGrey[3],
                                      fontSize: Get.width * 0.02,
                                      fontWeight: FontWeight.w900,
                                      height: 1.1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    height: 200.0,
                  ),
                ],
              ),
            ),
          ),
          NavBar(),
        ],
      ),
    );
  }
}
