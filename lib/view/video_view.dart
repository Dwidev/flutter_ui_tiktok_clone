import 'dart:math';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:ui_tiktok_clone/model/video_model.dart';
import 'package:ui_tiktok_clone/widgets/comment_bottomsheet.dart';
import 'package:ui_tiktok_clone/widgets/tiktok_bottomsheet.dart';
import 'package:ui_tiktok_clone/widgets/tiktok_icons.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final VideoModel data;

  const VideoView({Key? key, required this.data}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView>
    with SingleTickerProviderStateMixin {
  late AnimationController _discContoller;
  late VideoPlayerController _videoPlayerController;
  late Future _future;

  @override
  void initState() {
    _discContoller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _discContoller.repeat();

    _videoPlayerController = VideoPlayerController.asset(
      "assets/${widget.data.videoName}",
    );
    _future = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    // _videoPlayerController.play();

    super.initState();
  }

  @override
  void dispose() {
    _discContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: Colors.black,
          child: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return VideoPlayer(_videoPlayerController);
              }
              return Container();
            },
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "@${widget.data.username}",
                          style: textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        ExpandableText(
                          widget.data.caption,
                          style: textTheme.bodyText1?.copyWith(
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          expandText: "Lihat lainnya",
                          collapseText: "Sembunyikan",
                          expanded: true,
                          animationDuration: const Duration(seconds: 1),
                          linkStyle: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.music_note_2,
                              color: Colors.white,
                              size: 15,
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 30,
                              width: size.width / 2,
                              child: Marquee(
                                velocity: 40,
                                text: widget.data.soundName,
                                style: textTheme.bodyText1?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: size.height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _profileButton(widget.data.profilePicture),
                        _sideBarButton(
                          textTheme,
                          TikTokIcons.heart,
                          widget.data.totalLike,
                          onTap: () {},
                        ),
                        _sideBarButton(
                          textTheme,
                          TikTokIcons.chatBubble,
                          widget.data.totalComment,
                          onTap: () {
                            showCommentSection(
                              context: context,
                              listComment: widget.data.listComment,
                            );
                          },
                        ),
                        _sideBarButton(
                          textTheme,
                          TikTokIcons.reply,
                          widget.data.totalShare,
                          onTap: () {},
                        ),
                        disc(widget.data.profilePicture)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black.withOpacity(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.playlist_play,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Daftar Putar",
                        style: textTheme.bodyText1?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "nama daftar putar",
                        style: textTheme.bodyText1?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.navigate_next_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget disc(String profileLink) {
    return AnimatedBuilder(
      animation: _discContoller,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(25),
              gradient: const RadialGradient(
                colors: [Colors.grey, Colors.black],
              ),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(profileLink),
              ),
            ),
          ),
        ],
      ),
      builder: (context, child) {
        return Transform.rotate(
          angle: 2 * pi * _discContoller.value,
          child: child,
        );
      },
    );
  }

  Stack _profileButton(String profileLink) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(profileLink),
            ),
          ),
        ),
        Positioned(
          bottom: -10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.pink,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 18,
            ),
          ),
        )
      ],
    );
  }

  Widget _sideBarButton(
    TextTheme textTheme,
    IconData icon,
    String value, {
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: textTheme.bodyText1?.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
