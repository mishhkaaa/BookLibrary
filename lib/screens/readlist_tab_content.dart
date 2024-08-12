// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class ReadlistTabContent extends StatelessWidget {
  final List<String> readList;

  const ReadlistTabContent({required this.readList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: readList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(readList[index]),
        );
      },
    );
  }
}
