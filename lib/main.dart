import 'package:contact_app/Android_navigation/provider/bottom_navigation.dart';
import 'package:contact_app/Ios_Navigation/provider/navigation_provider.dart';
import 'package:contact_app/Views/Home/provider/home_provider.dart';
import 'package:contact_app/Views/Profile/provider/profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()),
        ChangeNotifierProvider.value(value: ProfileProvider()),
        ChangeNotifierProvider.value(value: NavigationProvider()),
        ChangeNotifierProvider.value(value: BottomNavigationProvider()),
      ],
      child: Consumer<ProfileProvider>(
        builder: (context, value, child) {
          // return CupertinoApp(
          //   theme: CupertinoThemeData(
          //     brightness: context.watch<ProfileProvider>().isDark
          //         ? Brightness.dark
          //         : Brightness.light,
          //   ),
          //   debugShowCheckedModeBanner: false,
          //   // initialRoute: '/contact_ios_detail',
          //   routes: RoutesIos.routes,
          // );
          return value.isAndroid
              ? MaterialApp(
                  theme: ThemeData(
                    brightness: context.watch<ProfileProvider>().isDark
                        ? Brightness.dark
                        : Brightness.light,
                  ),
                  debugShowCheckedModeBanner: false,
                  routes: Routes.routes,
                )
              : CupertinoApp(
                  theme: CupertinoThemeData(
                    brightness: context.watch<ProfileProvider>().isDark
                        ? Brightness.dark
                        : Brightness.light,
                  ),
                  debugShowCheckedModeBanner: false,
                  // initialRoute: '/contact_ios_detail',
                  routes: RoutesIos.routes,
                );
        },
      ),
    );
  }
}
