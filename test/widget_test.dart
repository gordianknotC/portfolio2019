// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child ui.widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/constants/keys.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/models/audio_resources.dart';

class Wrapper extends StatelessWidget {
  final Widget child;

  const Wrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter tester',
      home: Scaffold(
        body: Center(child: child),
      ),
    );
  }
}

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(App());
//   });
//
//   testWidgets('group audio widget', (tester) async {
//     void onPlayerPressed(dynamic e) {}
//     ;
//     final w = 300;
//     SimpleAudioGroup<AudioModel> result;
//     result = SimpleAudioGroup<AudioModel>(
//         key: Keys.skillMusicAudioGroup,
//         resources: [
//           AudioResources.electronicalA,
//           AudioResources.electronicalB,
//           AudioResources.gameTrack,
//           AudioResources.school
//         ],
//         builder: (ctx, resources) {
//           return Column(children: [
//             Expanded(
//                 child: SimpleAudioButton(resources[0],
//                     width: w / 2,
//                     onPress: onPlayerPressed,
//                     awareness: () => result.awareness),
//                 key: Keys.skillMusicAudioGroupS1),
//             Expanded(
//                 child: SimpleAudioButton(resources[1],
//                     width: w / 2,
//                     onPress: onPlayerPressed,
//                     awareness: () => result.awareness),
//                 key: Keys.skillMusicAudioGroupS2),
//             Expanded(
//                 child: SimpleAudioButton(resources[2],
//                     width: w / 2,
//                     onPress: onPlayerPressed,
//                     awareness: () => result.awareness),
//                 key: Keys.skillMusicAudioGroupS3),
//             Expanded(
//                 child: SimpleAudioButton(resources[3],
//                     width: w / 2,
//                     onPress: onPlayerPressed,
//                     awareness: () => result.awareness),
//                 key: Keys.skillMusicAudioGroupS4),
//           ]);
//         });
//     await tester.pumpWidget(Wrapper(child: result));
//   });
// }
