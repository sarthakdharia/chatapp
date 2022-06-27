import 'package:chatapp/utils/deminsions.dart';
import 'package:flutter/material.dart';

class Responsivelayout extends StatelessWidget {
  final Widget WebScreenLayout;
  final Widget MobileScreenLayout;
  const Responsivelayout(
      {Key? key,
      required this.MobileScreenLayout,
      required this.WebScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return WebScreenLayout;
        }
        return MobileScreenLayout;
      },
    );
  }
}
