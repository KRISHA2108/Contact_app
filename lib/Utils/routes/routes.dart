import 'package:contact_app/Android_navigation/view/bottom_navigation.dart';
import 'package:contact_app/Views/Contact/ios_contact_page.dart';
import 'package:contact_app/Views/Edit/view/edit_page.dart';
import 'package:contact_app/Views/Hide_page/views/hide_page.dart';
import 'package:contact_app/Views/Home/views/home_ios_page.dart';
import 'package:contact_app/Views/Intro/views/intro_page.dart';
import 'package:contact_app/Views/Profile/view/profile_ios.dart';
import 'package:contact_app/Views/Profile/view/profile_page.dart';
import 'package:contact_app/Views/Splash/splash_screen.dart';
import 'package:contact_app/Views/contact_details/views/contact_details.dart';
import 'package:contact_app/Ios_Navigation/view/ios_Navigation_bar.dart';
import 'package:contact_app/Views/contact_details/views/contact_ios_detail.dart';
import 'package:flutter/material.dart';
import '../../Views/Contact/contact_page.dart';
import '../../Views/Home/views/home_page.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const BottomNavigation(),
    '/splash': (context) => const SplashScreen(),
    '/intro': (context) => const IntroPage(),
    '/home': (context) => const HomePage(),
    '/contact': (context) => const ContactPage(),
    '/contact_details': (context) => const ContactDetails(),
    '/edit': (context) => const EditPage(),
    '/hide': (context) => const HidePage(),
    '/profile': (context) => const ProfilePage(),
  };
}

class RoutesIos {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const IosNavigationBar(),
    '/ios_home': (context) => const HomeIosPage(),
    '/ios_contact': (context) => const IosContractPage(),
    '/ios_profile': (context) => const ProfileIos(),
    '/ios_contact_detail': (context) => const ContactIosDetail(),
  };
}
