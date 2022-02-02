import 'package:flutter/material.dart';
import 'package:ui_tiktok_clone/widgets/tiktok_icons.dart';

class CustomBottomBarWidget extends StatelessWidget {
  const CustomBottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final barHeight = MediaQuery.of(context).size.height * 0.07;
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: barHeight,
        width: double.infinity,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _barItem(
              icon: TikTokIcons.home,
              title: "Beranda",
              textTheme: textTheme,
            ),
            _barItem(
              icon: TikTokIcons.search,
              title: "Temukan",
              textTheme: textTheme,
            ),
            _postBarItem(barHeight: barHeight),
            _barItem(
              icon: TikTokIcons.messages,
              title: "Kotak Masuk",
              textTheme: textTheme,
            ),
            _barItem(
              icon: TikTokIcons.profile,
              title: "Profil",
              textTheme: textTheme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _postBarItem({required double barHeight}) {
    return Container(
      transform: Matrix4.translationValues(0, -5, 0),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: 45,
      height: barHeight / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [Colors.cyan, Colors.pinkAccent],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _barItem({
    required IconData icon,
    required String title,
    required TextTheme textTheme,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: textTheme.bodyText1?.copyWith(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
