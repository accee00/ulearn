import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Search'),
    ),
    Center(
      child: Text('Course'),
    ),
    Center(
      child: Text('Chat'),
    ),
    Center(
      child: Text('Profile'),
    ),
  ];
  return widget[index];
}
