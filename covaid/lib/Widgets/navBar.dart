import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:covaid/Controllers/userController.dart';
import 'package:covaid/Services/authentication.dart';
import 'package:covaid/Utils/glintUI.dart';
import 'package:covaid/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  AuthServices _authMethods = AuthServices();

  Widget build(BuildContext context) {
    UserController _userController = Get.put(UserController());
    // Authentication auth = Authentication();
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      height: 60.0,
      width: Get.width,
      color: GlintUI.wheezGrey[0].withOpacity(1.0),
      // color: GlintUI.covaidGrey[0].withOpacity(0.5),
      padding: EdgeInsets.symmetric(
        horizontal: getFormFactor(context) == ScreenSize.Mobile
            ? GlintUI.width(context) * 0.1
            : 120.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 35.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          BouncingWidget(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              );
            },
            duration: Duration(milliseconds: 100),
            scaleFactor: 1.5,
            child: Text(
              'Covaid',
              style: TextStyle(
                color: GlintUI.wheezGrey[3],
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Spacer(),
          BouncingWidget(
            onPressed: () {
              Navigator.pushNamed(context, '/aid');
            },
            duration: Duration(milliseconds: 100),
            scaleFactor: 1.5,
            child: Text(
              'Aid Center',
              style: TextStyle(
                color: GlintUI.wheezGrey[2],
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 60.0,
          ),
          BouncingWidget(
            onPressed: () {},
            duration: Duration(milliseconds: 100),
            scaleFactor: 1.5,
            child: Text(
              'Support',
              style: TextStyle(
                color: GlintUI.wheezGrey[2],
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 60.0,
          ),
          BouncingWidget(
            onPressed: () {},
            duration: Duration(milliseconds: 100),
            scaleFactor: 1.5,
            child: Text(
              'Login',
              style: TextStyle(
                color: GlintUI.wheezGrey[3],
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          BouncingWidget(
            onPressed: () {
              // await auth.signInWithGoogle().then((result) {
              //   print(result);
              //   if (result != null) {}
              //   setState(() {});
              // }).catchError((error) {
              //   print('Registration Error: $error');
              // });
              performLogin(context);
            },
            child: Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: GlintUI.wheezPurple,
              ),
              padding: EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: GlintUI.wheezGrey[0],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    'https://holmesbuilders.com/wp-content/uploads/2016/12/male-profile-image-placeholder.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void performLogin(context) async {
    User user = await _authMethods.signIn();

    if (user != null) {
      authenticateUser(user, context);
    }
  }

  void authenticateUser(User user, context) {
    _authMethods.authenticateUser(user).then(
      (isNewUser) {
        if (isNewUser) {
          _authMethods.addDataToDb(user).then(
            (value) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              );
            },
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          );
        }
      },
    );
  }
}
