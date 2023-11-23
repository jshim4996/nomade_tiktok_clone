import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/authentication/widgets/password.screen.dart';

class EmailScreenArgs {
  final String username;

  EmailScreenArgs({
    required this.username,
  });
}

class EmailScreen extends StatefulWidget {
  static String routeName = 'email';
  static String routeUrl = 'email';

  final String username;

  const EmailScreen({
    super.key,
    required this.username,
    // required this.userName,
  });

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailComtorller = TextEditingController();

  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _emailComtorller.addListener(() {
      setState(() {
        _userEmail = _emailComtorller.text;
      });
    });
  }

  @override
  void dispose() {
    _emailComtorller.dispose();
    super.dispose();
  }

  String? _isEmailvalid() {
    if (_userEmail.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_userEmail)) {
      return 'not valid';
    }
    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmint() {
    if (_userEmail.isEmpty || _isEmailvalid() != null) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PassowrdScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as EmailScreenArgs;

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
              Text(
                "What is your email, ${widget.username}",
                style: const TextStyle(
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
                controller: _emailComtorller,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onEditingComplete: _onSubmint,
                decoration: InputDecoration(
                  hintText: 'User Email',
                  errorText: _isEmailvalid(),
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
                onTap: _onSubmint,
                child: FormButton(
                  disabled: _userEmail.isEmpty || _isEmailvalid() != null,
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
