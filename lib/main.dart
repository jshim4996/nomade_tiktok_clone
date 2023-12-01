import 'package:flutter/material.dart';
import 'package:tiktok_clone/common/video_configuration/video_configuration.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/username_screen.dart';

import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/router.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return VideoConfig(
      child: MaterialApp.router(
        routerConfig: router,
        title: 'TikTokClone',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFFE9435A),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFE9435A),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.red,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // home: const SignUpScreen(),
        // initialRoute: SignUpScreen.routeName,
        // routes: {
        //   SignUpScreen.routeName: (context) => const SignUpScreen(),
        //   UserName.routeName: (context) => const UserName(),
        //   LoginScreen.routeName: (context) => const LoginScreen(),
        //   EmailScreen.routeName: (context) => const EmailScreen(),
        // },
      ),
    );
  }
}
