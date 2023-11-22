import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/setting/setting_screen.dart';
import 'package:tiktok_clone/features/user/widget/persistent_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('심준'),
                actions: [
                  IconButton(
                      onPressed: _onGearPressed,
                      icon: const FaIcon(FontAwesomeIcons.gear))
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://image.zdnet.co.kr/2023/09/28/entere36907a8d327085865e0263d8048fc58.jpg'),
                      // child: Text('joon'),
                    ),
                    Gaps.v20,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('심준@'),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size16,
                          color: Colors.blue,
                        )
                      ],
                    ),
                    Gaps.v20,
                    SizedBox(
                      height: Sizes.size44,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                '97',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size20),
                              ),
                              Gaps.v3,
                              Text(
                                'Following',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            color: Colors.grey.shade400,
                            indent: Sizes.size10,
                            endIndent: Sizes.size10,
                          ),
                          Column(
                            children: [
                              const Text(
                                '10M',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size20),
                              ),
                              Gaps.v3,
                              Text(
                                'Following',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            color: Colors.grey.shade400,
                            indent: Sizes.size10,
                            endIndent: Sizes.size10,
                          ),
                          Column(
                            children: [
                              const Text(
                                '194.3M',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size20),
                              ),
                              Gaps.v3,
                              Text(
                                'Likes',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.33,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size12,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(
                            Sizes.size4,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Follow',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size12,
                      ),
                      child: Text(
                        'All highlights and where to watch live matches on FIFA+ I wonder how it would loook',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v20,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size14,
                        ),
                        Gaps.h4,
                        Text(
                          'https://nomaders.co',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 14),
                itemBuilder: (context, index) => Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 9 / 14,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: "assets/imgs/IMG_6751.jpeg",
                        image:
                            'https://image.fmkorea.com/files/attach/new/20200325/486616/2479995333/2844076156/99b983892094b5c6d2fc3736e15da7d1.jpg',
                      ),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text(
                  '2',
                  style: TextStyle(
                    color: Colors.black,
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

// class CustomDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.blue,
//       child: const FractionallySizedBox(
//         heightFactor: 1,
//         child: Center(
//           child: Text(
//             'Hello',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//     throw UnimplementedError();
//   }

//   @override
//   double get maxExtent => 120;

//   @override
//   double get minExtent => 80;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;

//     throw UnimplementedError();
//   }
// }
