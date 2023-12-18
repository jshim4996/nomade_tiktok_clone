// import 'package:flutter/widgets.dart';

// class VideoConfigData extends InheritedWidget {
//   final bool autoMute;

//   final void Function() changeAutoMute;

//   const VideoConfigData({
//     required this.autoMute,
//     required this.changeAutoMute,
//     required super.child,
//     super.key,
//   });

//   static VideoConfigData of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<VideoConfigData>()!;
//   }

//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return true;
//   }
// }

// class VideoConfig extends StatefulWidget {
//   final Widget child;

//   const VideoConfig({
//     super.key,
//     required this.child,
//   });

//   @override
//   State<VideoConfig> createState() => _VideoConfigState();
// }

// class _VideoConfigState extends State<VideoConfig> {
//   bool autoMute = true;

//   void changeAutoMute() {
//     setState(() {
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return VideoConfigData(
//       autoMute: autoMute,
//       changeAutoMute: changeAutoMute,
//       child: widget.child,
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';

class VideoConfig extends ChangeNotifier {
  bool autoMute = true;
  bool isAutoMute = true;

  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
  }

  void toggleIsAutoMute() {
    isAutoMute = !isAutoMute;
    notifyListeners();
  }
}

// final videoConfig = ValueNotifier(false);
