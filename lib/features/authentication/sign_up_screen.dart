import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/features/authentication/widgets/username_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const routeUrl = '/';
  static const routeName = 'signup';
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) async {
    // context.push(LoginScreen.routeName);
    context.push('/users/jshim?show=likes');
    // Navigator.of(context).pushNamed(LoginScreen.routeName);

    // final result = await Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const LoginScreen(),
    //   ),
    // );
  }

  void _onEmailTap(BuildContext context) {
    // context.push(UserName.routeName);
    context.pushNamed(UserName.routeName);

    // Navigator.of(context).pushNamed(UserName.routeName);
    // Navigator.of(context).push(
    // MaterialPageRoute(
    //   builder: (context) => const UserName(),
    // ),
    // PageRouteBuilder(
    //   transitionDuration: const Duration(
    //     milliseconds: 500,
    //   ),
    //   reverseTransitionDuration: const Duration(
    //     milliseconds: 500,
    //   ),
    //   pageBuilder: (context, animation, secondaryAnimation) =>
    //       const UserName(),
    //   transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //       // ScaleTransition(
    //       //   scale: animation,
    //       //   alignment: Alignment.bottomCenter,
    //       SlideTransition(
    //     position: Tween(
    //       begin: const Offset(0, -1),
    //       end: Offset.zero,
    //     ).animate(animation),
    //     child: FadeTransition(
    //       opacity: Tween(begin: 0.5, end: 1.0).animate(
    //         animation,
    //       ),
    //       child: child,
    //     ),
    //   ),
    // ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              Gaps.v8,
              const Text(
                'Sign up for TikTok',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                'Create a profile, follow other accounts, make your own videos, and more.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onEmailTap(context),
                child: const AuthButton(
                  text: 'Use phone or email',
                  icon: FaIcon(FontAwesomeIcons.user),
                ),
              ),
              Gaps.v16,
              const AuthButton(
                text: 'Continue with Apple',
                icon: FaIcon(FontAwesomeIcons.apple),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade50,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
              ),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onLoginTap(context),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
