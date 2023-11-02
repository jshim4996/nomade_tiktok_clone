import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 5;

  final PageController _pageController = PageController();

  final _scrollDuration = const Duration(milliseconds: 300);
  final _scrollCurve = Curves.linear;

  final List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.amber
  ];

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 5;
      colors.addAll([
        Colors.blue,
        Colors.red,
        Colors.yellow,
        Colors.purple,
        Colors.amber,
      ]);
      setState(() {});
    }
  }

  _onVideoFinsh() {
    return;
    // _pageController.nextPage(
    //   duration: _scrollDuration,
    //   curve: _scrollCurve,
    // );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      displacement: 50,
      edgeOffset: 20,
      color: Colors.red,
      child: PageView.builder(
        // pageSnapping: false,
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: _itemCount,
        itemBuilder: (context, index) => VideoPost(
          onVideoFinsh: _onVideoFinsh,
          index: index,
        ),
        //  Container(
        //   color: colors[index],
        //   child: Center(
        //     child: Text(
        //       "Screen $index",
        //       style: const TextStyle(
        //         fontSize: Sizes.size56,
        //       ),
        //     ),
        //   ),
        // ),

        // children: [
        // Container(
        //   color: Colors.blue,
        // ),
        // Container(
        //   color: Colors.green,
        // ),
        // Container(
        //   color: Colors.red,
        // ),
        // Container(
        //   color: Colors.yellow,
        // ),
      ),
    );
  }
}
