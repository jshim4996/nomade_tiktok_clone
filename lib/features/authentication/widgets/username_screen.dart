import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class UserName extends StatefulWidget {
  static const routeUrl = 'username';
  static const routeName = 'username';
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = '';

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(
        () {
          _username = _usernameController.text;
        },
      );
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    if (_username.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailScreen(
          username: _username,
        ),
      ),
    );
    // context.pushNamed(
    //   EmailScreen.routeName,
    //   extra: EmailScreenArgs(username: _username),
    // );
    // Navigator.pushNamed(
    //   context,
    //   EmailScreen.routeName,
    //   arguments: EmailScreenArgs(
    //     userName: _username,
    //   ),
    // );
    // of(context).push(MaterialPageRoute(
    //   builder: (context) => EmailScreen(
    //     userName: _username,
    //   ),
    // )
    // );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "Create Names",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                "You can always change this later.",
                style: TextStyle(fontSize: Sizes.size16, color: Colors.black54),
              ),
              Gaps.v16,
              TextField(
                controller: _usernameController,
                keyboardType: TextInputType.emailAddress,
                onEditingComplete: _onNextTap,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Username',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onNextTap,
                child: FormButton(
                  disabled: _username.isEmpty,
                  title: 'Next',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
