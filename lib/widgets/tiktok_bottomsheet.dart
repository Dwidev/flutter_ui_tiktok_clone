import 'package:flutter/material.dart';

void tiktokBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext context) builder,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    builder: (context) {
      return builder(context);
    },
  );
}
