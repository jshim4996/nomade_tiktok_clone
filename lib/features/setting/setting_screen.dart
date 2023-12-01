import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/common/video_configuration/video_configuration.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notification = false;

  void _onChangeNotification(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('setting'),
        ),
        body: ListView(
          children: [
            // ListTile(
            //   onTap: () => showAboutDialog(
            //     context: context,
            //     applicationVersion: '1.0',
            //     applicationLegalese: '도용 금지',
            //   ),
            //   title: const Text(
            //     'About',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   subtitle: const Text('About this app...'),
            // ),
            // CupertinoSwitch(
            //   value: _notification,
            //   onChanged: _onChangeNotification,
            // ),
            SwitchListTile.adaptive(
              value: VideoConfigData.of(context).autoMute,
              onChanged: (value) {
                VideoConfigData.of(context).changeAutoMute();
              },
              title: const Text('Auto Mute'),
              subtitle: const Text('videos will be muted by default'),
            ),
            CheckboxListTile(
              // checkColor: Colors.black,
              activeColor: Colors.black,
              value: _notification,
              onChanged: _onChangeNotification,
              title: const Text('Enable Notifications'),
            ),
            ListTile(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                );
                print(date);
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                print(time);
                final booking = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(
                          appBarTheme: const AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      )),
                      child: child!,
                    );
                  },
                );
                print(booking);
              },
              title: const Text('What is your birthday?'),
            ),
            ListTile(
              title: const Text('Log out iOS'),
              textColor: Colors.red,
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('정말 로그아웃 하시나요'),
                    content: const Text('로그아웃시 기존 자동 로그인이 해제 됩니다.'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('아니요'),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text('예'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Log out Android'),
              textColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('정말 로그아웃 하시나요'),
                    content: const Text('로그아웃시 기존 자동 로그인이 해제 됩니다.'),
                    actions: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const FaIcon(FontAwesomeIcons.car),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('예'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('iOS / Bottom'),
              textColor: Colors.red,
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text('정말 로그아웃 하시나요'),
                    message: const Text('로그아웃시 자동로그인이 해제 됩니다.'),
                    actions: [
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('아니요'),
                      ),
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('예'),
                      ),
                    ],
                  ),
                );
              },
            ),
            const AboutListTile()
          ],
        )
        // ListWheelScrollView(
        //   itemExtent: 200,
        //   diameterRatio: 1,
        //   children: [
        //     for (var x in [
        //       1,
        //       2,
        //       3,
        //       4,
        //       5,
        //       6,
        //       7,
        //     ])
        //       FractionallySizedBox(
        //         widthFactor: 1,
        //         child: Container(
        //           color: Colors.teal,
        //           child: const Center(
        //             child: Text(
        //               'Pick me',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 39,
        //               ),
        //             ),
        //           ),
        //         ),
        //       )
        //   ],
        // )
        // const Column(
        //   children: [
        //     CloseButton(),
        //   ],
        // ),
        );
  }
}
