import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('심준'),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.gear))
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.grey.shade300,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: const TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsets.only(
                      bottom: Sizes.size10,
                      top: Sizes.size10,
                    ),
                    tabs: [
                      // FaIcon(FontAwesomeIcons.table),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Icon(
                          Icons.grid_4x4_outlined,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.heart,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    children: [
                      GridView.builder(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: 20,
                          padding: const EdgeInsets.all(
                            Sizes.size6,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: Sizes.size10,
                                  mainAxisSpacing: Sizes.size10,
                                  childAspectRatio: 9 / 21),
                          itemBuilder: (context, index) => Column(
                                children: [
                                  Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(Sizes.size14),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 9 / 16,
                                      child: FadeInImage.assetNetwork(
                                        fit: BoxFit.cover,
                                        placeholder:
                                            "assets/imgs/IMG_6751.jpeg",
                                        image:
                                            'https://image.fmkorea.com/files/attach/new/20200325/486616/2479995333/2844076156/99b983892094b5c6d2fc3736e15da7d1.jpg',
                                      ),
                                    ),
                                  ),
                                  Gaps.v8,
                                  const Text(
                                    'This is a very long Catpion for my tiktok that im upload just now currently.',
                                    style: TextStyle(
                                      fontSize: Sizes.size16 + Sizes.size2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Gaps.v5,
                                  DefaultTextStyle(
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 12,
                                          foregroundImage: NetworkImage(
                                              'https://image.zdnet.co.kr/2023/09/28/entere36907a8d327085865e0263d8048fc58.jpg'),
                                        ),
                                        Gaps.h4,
                                        const Expanded(
                                          child: Text(
                                            'mya avatar is going to be very long',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Gaps.h4,
                                        FaIcon(
                                          FontAwesomeIcons.heart,
                                          size: Sizes.size16,
                                          color: Colors.grey.shade600,
                                        ),
                                        Gaps.h2,
                                        const Text(
                                          '2.5M',
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
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
                )
              ],
            ),
          )
          // SliverAppBar(
          //   snap: true,
          //   floating: true,
          //   pinned: true,
          //   stretch: true,
          //   backgroundColor: Colors.teal,
          //   collapsedHeight: 80,
          //   expandedHeight: 200,
          //   flexibleSpace: FlexibleSpaceBar(
          //     stretchModes: const [
          //       StretchMode.blurBackground,
          //       // StretchMode.fadeTitle,
          //       StretchMode.zoomBackground,
          //     ],
          //     background: Image.asset(
          //       'assets/imgs/IMG_6751.jpeg',
          //       fit: BoxFit.cover,
          //     ),
          //     title: const Text(
          //       'hello',
          //     ),
          //   ),
          // ),
          // const SliverToBoxAdapter(
          //   child: Column(
          //     children: [CircleAvatar(backgroundColor: Colors.red, radius: 20)],
          //   ),
          // ),
          // SliverFixedExtentList(
          //     delegate: SliverChildBuilderDelegate(
          //       childCount: 50,
          //       (context, index) => Container(
          //         color: Colors.amber[100 * (index % 9)],
          //         child: Align(
          //           alignment: Alignment.center,
          //           child: Text('item $index '),
          //         ),
          //       ),
          //     ),
          //     itemExtent: 100),
          // SliverPersistentHeader(
          //   delegate: CustomDelegate(),
          //   pinned: true,
          //   // floating: true,
          // ),
          // SliverGrid(
          //   delegate: SliverChildBuilderDelegate(
          //     childCount: 50,
          //     (context, index) => Container(
          //       color: Colors.blue[100 * (index % 9)],
          //       child: Align(
          //         alignment: Alignment.center,
          //         child: Text('item $index '),
          //       ),
          //     ),
          //   ),
          //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 100,
          //     mainAxisSpacing: Sizes.size20,
          //     crossAxisSpacing: Sizes.size20,
          //     childAspectRatio: 1,
          //   ),
          // )
        ],
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
