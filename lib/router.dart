import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widget/main_naigation/main_navigation.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/username_screen.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';
import 'package:tiktok_clone/features/inbox/chart_screen.dart';
import 'package:tiktok_clone/features/inbox/chat_detail_screen.dart';
import 'package:tiktok_clone/features/onBoarding/intersts_screen.dart';
import 'package:tiktok_clone/features/user/user_profile_screen.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeUrl,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeUrl,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterstsScreen.routeName,
      path: InterstsScreen.routeUrl,
      builder: (context, state) => const InterstsScreen(),
    ),
    GoRoute(
      path: "/:tab(home|discover|inbox|profile)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      name: ActivityScreen.routeName,
      path: ActivityScreen.routeUrl,
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
        name: ChartScreen.routeName,
        path: ChartScreen.routeUrl,
        builder: (context, state) => const ChartScreen(),
        routes: [
          GoRoute(
            name: ChatDetailScreen.routeName,
            path: ChatDetailScreen.routeUrl,
            builder: (context, state) {
              final chatId = state.params["chatId"]!;
              return ChatDetailScreen(chatId: chatId);
            },
          )
        ]),
  ],
  // routes: [
  //   GoRoute(
  //       name: SignUpScreen.routeName,
  //       path: SignUpScreen.routeUrl,
  //       builder: (context, state) => const SignUpScreen(),
  //       routes: [
  //         GoRoute(
  //             name: UserName.routeName,
  //             path: UserName.routeUrl,
  //             builder: (context, state) => const UserName(),
  //             routes: [
  //               GoRoute(
  //                 name: EmailScreen.routeName,
  //                 path: EmailScreen.routeUrl,
  //                 builder: (context, state) => const EmailScreen(
  //                   username: 'joon',
  //                 ),
  //               ),
  //             ])
  //       ]),
  //   GoRoute(
  //     path: LoginScreen.routeName,
  //     builder: (context, state) => const LoginScreen(),
  //   ),
  //   /* GoRoute(
  //     name: 'username_screen',
  //     path: UserName.routeName,
  //     // builder: (context, state) => const UserName(),
  //     pageBuilder: (context, state) {
  //       return CustomTransitionPage(
  //         child: const UserName(),
  //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //           return FadeTransition(
  //             opacity: animation,
  //             child: ScaleTransition(
  //               scale: animation,
  //               child: child,
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   ), */
  //   // GoRoute(
  //   //   path: EmailScreen.routeName,
  //   //   builder: (context, state) {
  //   //     final args = state.extra as EmailScreenArgs;
  //   //     return EmailScreen(
  //   //       username: args.username,
  //   //     );
  //   //   },
  //   // ),
  //   GoRoute(
  //     path: "/users/:username",
  //     builder: (context, state) {
  //       final username = state.params['username'];
  //       final tab = state.queryParams['show'];
  //       return UserProfileScreen(
  //         username: username!,
  //         tab: tab!,
  //       );
  //     },
  //   ),
  // ],
);
