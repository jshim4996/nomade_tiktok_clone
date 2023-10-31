import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onBoarding/intersts_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const InterstsScreen(),
          ),
          (route) => false,
        );
      }
    }
  }

  final Map<String, String> formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('login'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gaps.v16,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Emil',
                    ),
                    validator: (value) {
                      if (value == null && value!.isEmpty) {
                        return 'i dont like your email';
                      }
                      return null;
                      // return null;
                    },
                    onSaved: ((newValue) => {
                          if (newValue != null) {formData['email'] = newValue}
                        }),
                  ),
                  Gaps.v16,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null && value!.isEmpty) {
                        return 'wrong password';
                      }
                      return null;
                    },
                    onSaved: ((newValue) => {
                          if (newValue != null)
                            {formData['password'] = newValue}
                        }),
                  ),
                  Gaps.v28,
                  GestureDetector(
                    onTap: _onSubmitTap,
                    child: const FormButton(
                      disabled: false,
                      title: 'Log in',
                    ),
                  )
                ],
              )),
        ));
  }
}
