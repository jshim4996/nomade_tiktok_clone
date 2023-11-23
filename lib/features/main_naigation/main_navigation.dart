import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/main_naigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_naigation/widgets/post_viedo_button.dart';
import 'package:tiktok_clone/features/main_naigation/widgets/stf_screen.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/features/user/user_profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 4;

  final screen = [
    const Center(
      child: Text('home'),
    ),
    const Center(
      child: Text('search'),
    ),
    const Center(
      child: Text('search'),
    ),
    const Center(
      child: Text('search'),
    ),
    const Center(
      child: Text('search'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    void _onTap(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    void _onPostViedeoButtonTap() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('video'),
            ),
          ),
          fullscreenDialog: true,
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(
              username: 'joon',
              tab: 'like',
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavTap(
                text: 'Home',
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTab: () => _onTap(0),
                selecedIndex: _selectedIndex,
              ),
              NavTap(
                text: 'Discover',
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTab: () => _onTap(1),
                selecedIndex: _selectedIndex,
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostViedeoButtonTap,
                child: PostViedeoButton(
                  inverted: _selectedIndex != 0,
                ),
              ),
              Gaps.h24,
              NavTap(
                text: 'Inbox',
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                onTab: () => _onTap(3),
                selecedIndex: _selectedIndex,
              ),
              NavTap(
                text: 'Profile',
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTab: () => _onTap(4),
                selecedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
    // CupertinoTabScaffold(
    //   tabBar: CupertinoTabBar(
    //     items: const [
    //       BottomNavigationBarItem(
    //           icon: Icon(
    //             CupertinoIcons.house,
    //           ),
    //           label: "Home"),
    //       BottomNavigationBarItem(
    //         icon: FaIcon(
    //           CupertinoIcons.search,
    //         ),
    //         label: 'Search',
    //       ),
    //     ],
    //   ),
    //   tabBuilder: (context, index) => screen[index],
    // );

    // return Scaffold(
    //   body: screen[_selectedIndex],
    //   bottomNavigationBar: NavigationBar(
    //     selectedIndex: _selectedIndex,
    //     onDestinationSelected: _onTap,
    //     destinations: const [
    //       NavigationDestination(
    //         icon: FaIcon(
    //           FontAwesomeIcons.house,
    //           color: Colors.green,
    //         ),
    //         label: 'Home',
    //       ),
    //       NavigationDestination(
    //         icon: FaIcon(
    //           FontAwesomeIcons.magnifyingGlass,
    //           color: Colors.blue,
    //         ),
    //         label: 'Serach',
    //       ),
    //     ],
    //   ),
    //   // bottomNavigationBar: BottomNavigationBar(
    //   //   currentIndex: _selectedIndex,
    //   //   // type: BottomNavigationBarType.shifting,
    //   //   onTap: _onTap,
    //   //   selectedItemColor: Theme.of(context).primaryColor,
    //   //   items: const [
    //   //     BottomNavigationBarItem(
    //   //       icon: FaIcon(FontAwesomeIcons.house),
    //   //       label: 'Home',
    //   //       tooltip: 'What are you?',
    //   //       backgroundColor: Colors.amber,
    //   //     ),
    //   //     BottomNavigationBarItem(
    //   //       icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //   //       label: 'serach',
    //   //       tooltip: 'What are you?',
    //   //       backgroundColor: Colors.blue,
    //   //     ),
    //   //     BottomNavigationBarItem(
    //   //       icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //   //       label: 'serach',
    //   //       tooltip: 'What are you?',
    //   //       backgroundColor: Colors.green,
    //   //     ),
    //   //     BottomNavigationBarItem(
    //   //       icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //   //       label: 'serach',
    //   //       tooltip: 'What are you?',
    //   //       backgroundColor: Colors.yellow,
    //   //     ),
    //   //     BottomNavigationBarItem(
    //   //       icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //   //       label: 'serach',
    //   //       tooltip: 'What are you?',
    //   //       backgroundColor: Colors.purple,
    //   //     ),
    //   //   ],
    //   // ),
    // );
  }
}
