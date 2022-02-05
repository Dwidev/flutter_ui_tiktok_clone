import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/video_model.dart';
import '../view/video_view.dart';
import '../widgets/tiktok_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final isFyp = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(
            TikTokIcons.search,
            size: 20,
          ),
          SizedBox(width: 20)
        ],
        leading: const Icon(Icons.live_tv),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appBarTitle(textTheme, "Mengikuti", false),
            const SizedBox(width: 10),
            const Text("|"),
            const SizedBox(width: 10),
            appBarTitle(textTheme, "Untuk anda", true),
          ],
        ),
      ),
      body: PageView.builder(
        onPageChanged: (value) {},
        scrollDirection: Axis.vertical,
        itemCount: dummyListVideo.length,
        itemBuilder: (context, index) {
          final data = dummyListVideo[index];
          return VideoView(data: data);
        },
      ),
    );
  }

  Text appBarTitle(TextTheme textTheme, String title, bool isFyp) {
    return Text(
      title,
      style: textTheme.bodyText1?.copyWith(
        fontSize: 15,
        color: isFyp ? Colors.white : Colors.grey[100],
        fontWeight: isFyp ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
