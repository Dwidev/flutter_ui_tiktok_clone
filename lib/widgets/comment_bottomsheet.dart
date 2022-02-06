import 'package:flutter/material.dart';

import 'package:ui_tiktok_clone/model/comment_model.dart';
import 'package:ui_tiktok_clone/widgets/tiktok_bottomsheet.dart';
import 'package:ui_tiktok_clone/widgets/tiktok_icons.dart';

void showCommentSection({
  required BuildContext context,
  required List<CommentModel> listComment,
}) {
  tiktokBottomSheet(
    context: context,
    builder: (context) {
      return _CommentSectionWidget(
        listComment: listComment,
      );
    },
  );
}

class _CommentSectionWidget extends StatelessWidget {
  final List<CommentModel> listComment;
  const _CommentSectionWidget({
    Key? key,
    required this.listComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: size.height / 1.8,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${listComment.length} Komentar",
                    textAlign: TextAlign.center,
                    style: textTheme.bodyText1?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listComment.length,
              itemBuilder: (context, index) {
                final commentData = listComment[index];
                return InkWell(
                  onTap: () {
                    print("on klik komen");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            commentData.photoUrl,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                commentData.name,
                                style: textTheme.caption?.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                commentData.comment,
                                style: textTheme.bodyText1?.copyWith(
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    "10-29",
                                    style: textTheme.caption?.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Balas",
                                    style: textTheme.caption?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              if (commentData.isLikedCreator) ...{
                                _IsLikedCreatorWidget(textTheme: textTheme),
                                const SizedBox(height: 10),
                              },
                              if (commentData.listReplyComment.isNotEmpty) ...{
                                Row(
                                  children: [
                                    Text(
                                      "Lihat balasan (100)",
                                      style: textTheme.caption?.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.grey.shade700,
                                    )
                                  ],
                                ),
                              }
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 5),
                            const Icon(
                              TikTokIcons.heart,
                              size: 13,
                              color: Colors.grey,
                            ),
                            Text(
                              commentData.totalLike.toString(),
                              style: textTheme.caption?.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _IsLikedCreatorWidget extends StatelessWidget {
  const _IsLikedCreatorWidget({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Text(
        "Disukai oleh kreator",
        style: textTheme.caption?.copyWith(
          fontSize: 12,
        ),
      ),
    );
  }
}
