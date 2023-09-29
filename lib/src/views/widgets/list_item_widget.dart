import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    super.key,
    required this.newList,
  });

  final UserModel newList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.blue[50]),
      child: Column(
        children: [
          textHeadWidget(),
          textTitleWidget(),
          textContentWidget(),
        ],
      ),
    );
  }

  Padding textHeadWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "User:${newList.id.toString()}",
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding textContentWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        newList.body,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      ),
    );
  }

  Padding textTitleWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        newList.title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
