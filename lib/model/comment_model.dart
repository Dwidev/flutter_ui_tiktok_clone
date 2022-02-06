class CommentModel {
  final String photoUrl;
  final String name;
  final String comment;
  final bool isLikedCreator;
  final int totalLike;
  final String commentDate;
  final List<CommentModel> listReplyComment;

  CommentModel({
    required this.photoUrl,
    required this.name,
    required this.comment,
    required this.isLikedCreator,
    required this.totalLike,
    required this.commentDate,
    this.listReplyComment = const [],
  });
}
