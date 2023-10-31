import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onBoarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/onBoarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterstsScreen extends StatefulWidget {
  const InterstsScreen({super.key});

  @override
  State<InterstsScreen> createState() => _InterstsScreenState();
}

class _InterstsScreenState extends State<InterstsScreen> {
  final ScrollController _scrollerController = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollerController.offset > 100) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollerController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
            opacity: _showTitle ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Text('Choose your interests')),
      ),
      body: Scrollbar(
        controller: _scrollerController,
        child: SingleChildScrollView(
          controller: _scrollerController,
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size24,
              right: Sizes.size24,
              bottom: Sizes.size16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                const Text(
                  'Choose your interests',
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v20,
                const Text(
                  'Get better video recommendations',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
                Gaps.v64,
                Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: [
                    for (var interset in interests)
                      InterestButton(interset: interset),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
            padding: const EdgeInsets.only(
              bottom: Sizes.size80,
              top: Sizes.size16,
              left: Sizes.size24,
              right: Sizes.size24,
            ),
            child: CupertinoButton(
              color: Theme.of(context).primaryColor,
              onPressed: _onNextTap,
              child: const Text('Next'),
            )
            // Container(
            //   padding: const EdgeInsets.symmetric(
            //     vertical: Sizes.size20,
            //   ),
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).primaryColor,
            //   ),
            //   child: const Text(
            //     'Next',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: Sizes.size16,
            //     ),
            //   ),
            // ),
            ),
      ),
    );
  }
}
