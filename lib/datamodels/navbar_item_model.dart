import 'package:flutter/material.dart';

// itemmodel for the TopNavigationBar - get used in TopNavigationBar widgets
class NavBarItemModel {
  final String title;
  final String navigationPath;
  final IconData iconData;

  NavBarItemModel({
    this.title,
    this.navigationPath,
    this.iconData,
  });
}
