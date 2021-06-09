import 'package:covaid/Screens/AidScreen/aidScreen.dart';
import 'package:covaid/Screens/HomeScreen/footerSection.dart';
import 'package:covaid/Screens/HomeScreen/getAidSection.dart';
import 'package:covaid/Screens/HomeScreen/mainSection.dart';
import 'package:covaid/Screens/HomeScreen/trackerSection.dart';
import 'package:covaid/Services/authentication.dart';
import 'package:covaid/Utils/glintUI.dart';
import 'package:covaid/Widgets/navBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AuthServices _authMethods = AuthServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/aid': (context) => AidScreen(),
      },
      theme: ThemeData(
        primaryColor: GlintUI.covaidPurple,
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Covaid',
      home: FutureBuilder(
        future: _authMethods.getCurrentUser(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return HomePage();
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  ScrollController _homePageScrollController = ScrollController();
  final List<Widget> sections = [
    MainSection(),
    // TrackerSection(),
    // GetAidSection(),
    // FooterSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Scrollbar(
            controller: _homePageScrollController,
            isAlwaysShown: true,
            thickness: 6.0,
            child: SingleChildScrollView(
              controller: _homePageScrollController,
              child: Column(
                children: sections,
              ),
            ),
          ),
          NavBar(),
        ],
      ),
    );
  }
}
