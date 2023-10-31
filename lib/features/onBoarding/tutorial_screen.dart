import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_naigation/main_navigation.dart';
import 'package:tiktok_clone/features/onBoarding/intersts_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showinPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showinPage = Page.second;
      });
    } else {
      setState(() {
        _showinPage = Page.first;
      });
    }
  }

  void _onEnterApp() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gaps.v80,
                  Text(
                    'Watch cool First',
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    'Videos are personalized for you based on what you watch, like, and share.',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                ],
              ),
              secondChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gaps.v80,
                  Text(
                    'Watch cool second',
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    'Take care of one another!',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                ],
              ),
              crossFadeState: _showinPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size48,
              horizontal: Sizes.size24,
            ),
            child: AnimatedOpacity(
              duration: const Duration(
                milliseconds: 300,
              ),
              opacity: _showinPage == Page.first ? 0 : 1,
              child: CupertinoButton(
                onPressed: _onEnterApp,
                color: Theme.of(context).primaryColor,
                child: const Text('Enter the app!'),
              ),
            ),
          ),
        ),
      ),
    );

    /**좌우 이동형 */
    // DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     body: const SafeArea(
    //       child: TabBarView(
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: Sizes.size24,
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Gaps.v52,
    //                 Text(
    //                   'Watch cool viedos!',
    //                   style: TextStyle(
    //                     fontSize: Sizes.size40,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Gaps.v16,
    //                 Text(
    //                   'Videos are personalized for you based on what you watch, like, and share.',
    //                   style: TextStyle(
    //                     fontSize: Sizes.size20,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: Sizes.size24,
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Gaps.v52,
    //                 Text(
    //                   'Watch cool viedos!',
    //                   style: TextStyle(
    //                     fontSize: Sizes.size40,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Gaps.v16,
    //                 Text(
    //                   'Videos are personalized for you based on what you watch, like, and share.',
    //                   style: TextStyle(
    //                     fontSize: Sizes.size20,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: Sizes.size24,
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Gaps.v52,
    //                 Text(
    //                   'Watch cool viedos!',
    //                   style: TextStyle(
    //                     fontSize: Sizes.size40,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Gaps.v16,
    //                 Text(
    //                   'Videos are personalized for you based on what you watch, like, and share.',
    //                   style: TextStyle(
    //                     fontSize: Sizes.size20,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     bottomNavigationBar: BottomAppBar(
    //       child: Container(
    //         padding: const EdgeInsets.symmetric(
    //           vertical: Sizes.size48,
    //         ),
    //         child: const Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             TabPageSelector(
    //               color: Colors.white,
    //               selectedColor: Colors.black38,
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
