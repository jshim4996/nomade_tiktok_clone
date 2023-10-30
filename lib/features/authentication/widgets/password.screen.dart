import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PassowrdScreen extends StatefulWidget {
  const PassowrdScreen({super.key});

  @override
  State<PassowrdScreen> createState() => _PassowrdScreenState();
}

class _PassowrdScreenState extends State<PassowrdScreen> {
  final TextEditingController _passwordComtorller = TextEditingController();

  String _userPassword = '';

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordComtorller.addListener(() {
      setState(() {
        _userPassword = _passwordComtorller.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordComtorller.dispose();
    super.dispose();
  }

  void _onSubmint() {
    if (!_isPassowrdValid()) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  bool _isPassowrdValid() {
    return _userPassword.isNotEmpty && _userPassword.length > 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onClearTap() {
    _passwordComtorller.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
                "Password",
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
                controller: _passwordComtorller,
                keyboardType: TextInputType.emailAddress,
                obscureText: _obscureText,
                autocorrect: true,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h5,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: 'Your Passord',
                  // errorText: _isPassowrdValid(),
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
              Gaps.v10,
              const Text(
                'Your password must have',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size16,
                    color: _isPassowrdValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  Gaps.h5,
                  const Text('8 to 20 Characters'),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmint,
                child: FormButton(
                  disabled: !_isPassowrdValid(),
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
