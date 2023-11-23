import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/username_screen.dart';
import 'package:tiktok_clone/features/user/user_profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeUrl,
        builder: (context, state) => const SignUpScreen(),
        routes: [
          GoRoute(
              name: UserName.routeName,
              path: UserName.routeUrl,
              builder: (context, state) => const UserName(),
              routes: [
                GoRoute(
                  name: EmailScreen.routeName,
                  path: EmailScreen.routeUrl,
                  builder: (context, state) => const EmailScreen(
                    username: 'joon',
                  ),
                ),
              ])
        ]),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    /* GoRoute(
      name: 'username_screen',
      path: UserName.routeName,
      // builder: (context, state) => const UserName(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const UserName(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        );
      },
    ), */
    // GoRoute(
    //   path: EmailScreen.routeName,
    //   builder: (context, state) {
    //     final args = state.extra as EmailScreenArgs;
    //     return EmailScreen(
    //       username: args.username,
    //     );
    //   },
    // ),
    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.params['username'];
        final tab = state.queryParams['show'];
        return UserProfileScreen(
          username: username!,
          tab: tab!,
        );
      },
    ),
  ],
);
