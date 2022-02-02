class VideoModel {
  final String username;
  final String videoName;
  final String caption;
  final String soundName;
  final String profilePicture;
  final String totalLike;
  final String totalComment;
  final String totalShare;

  VideoModel({
    required this.username,
    required this.videoName,
    required this.caption,
    required this.soundName,
    required this.profilePicture,
    required this.totalLike,
    required this.totalComment,
    required this.totalShare,
  });
}

final dummyListVideo = [
  VideoModel(
    username: "buciners",
    videoName: "vid1.mp4",
    caption: "Asik Asik Asik Asik Asik ",
    soundName: "Sound Asli - Buciners",
    profilePicture: "https://i.ytimg.com/vi/Oxl6A8da9_s/hqdefault.jpg",
    totalLike: "1.5M",
    totalComment: "11K",
    totalShare: "8237",
  ),
  VideoModel(
    username: "kumpulanhewanlucu",
    videoName: "vid2.mp4",
    caption: "Asik Asik Asik Asik Asik ",
    soundName: "Coconut Mall (From 'Mario Kart Wii') - Arcade Player",
    profilePicture:
        "https://asset.kompas.com/crops/CLKOgydea1KEwTYuz1rOrExk1hM=/0x36:1117x781/750x500/data/photo/2021/10/05/615c5f08bd530.jpg",
    totalLike: "2.5M",
    totalComment: "21K",
    totalShare: "2343",
  ),
  VideoModel(
    username: "manusiagalau",
    videoName: "vid3.mp4",
    caption: "Asik Asik Asik Asik Asik ",
    soundName: "Last Child - Slowly Sound",
    profilePicture:
        "https://cdn0-production-images-kly.akamaized.net/lblYgosAVBOctbYCx9TZQq2dnGE=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3489640/original/019358300_1624345538-francisco-gonzalez-M8UEJd58GcE-unsplash_Fotor.jpg",
    totalLike: "5.5M",
    totalComment: "1M",
    totalShare: "10K",
  ),
  VideoModel(
    username: "_gemini.girl",
    videoName: "vid4.mp4",
    caption: "Asik Asik Asik Asik Asik ",
    soundName: "Sound asli - _gemini.girl",
    profilePicture:
        "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/12/30/1796415239.jpg",
    totalLike: "1.5M",
    totalComment: "11K",
    totalShare: "1762",
  ),
];
