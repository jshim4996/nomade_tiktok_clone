import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/inbox/chat_detail_screen.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  final List<int> _items = [];

  final Duration _duration = const Duration(milliseconds: 500);

  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(
        _items.length,
        duration: _duration,
      );
      _items.add(_items.length);
    }
  }

  void _deleteItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
          index,
          (context, animation) => SizeTransition(
                sizeFactor: animation,
                child: Container(
                  color: Colors.red,
                  child: _makeTile(index),
                ),
                // const ListTile(
                //   title: Text('Bye bye'),
                // ),
              ),
          duration: _duration);
      _items.remove(index);
    }
  }

  void _onChatTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChatDetailScreen(),
      ),
    );
  }

  Widget _makeTile(int index) {
    return ListTile(
      onLongPress: () => _deleteItem(index),
      onTap: _onChatTap,
      leading: const CircleAvatar(
        radius: 30,
        foregroundImage: NetworkImage(
            'https://image.zdnet.co.kr/2023/09/28/entere36907a8d327085865e0263d8048fc58.jpg'),
        child: Text('준'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Joon ($index)',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '2:16 pm',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: Sizes.size14,
            ),
          ),
        ],
      ),
      subtitle: const Text("최선은 다하자"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          )
        ],
        elevation: 1,
        title: const Text(
          'Direct messages',
        ),
      ),
      body: AnimatedList(
        key: _key,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        itemBuilder: (context, int index, animation) {
          return FadeTransition(
            opacity: animation,
            key: UniqueKey(),
            child: SizeTransition(
              sizeFactor: animation,
              child: _makeTile(index),
            ),
          );
        },
        // children: [
        //   ListTile(
        //     leading: const CircleAvatar(
        //       radius: 30,
        //       foregroundImage: NetworkImage(
        //           'https://image.zdnet.co.kr/2023/09/28/entere36907a8d327085865e0263d8048fc58.jpg'),
        //       child: Text('준'),
        //     ),
        //     title: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       crossAxisAlignment: CrossAxisAlignment.end,
        //       children: [
        //         const Text(
        //           'Joon',
        //           style: TextStyle(
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //         Text(
        //           '2:16 pm',
        //           style: TextStyle(
        //             color: Colors.grey.shade500,
        //             fontSize: Sizes.size14,
        //           ),
        //         ),
        //       ],
        //     ),
        //     subtitle: const Text("최선은 다하자"),
        //   ),
        // ],
      ),
    );
  }
}
