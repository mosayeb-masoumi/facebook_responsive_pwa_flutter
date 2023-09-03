import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive(
      {super.key,
      required this.mobile,
      this.tablet,
      required this.desktop});



  static bool isMobile(context){
    return MediaQuery.sizeOf(context).width < 800;
  }

  static bool isTablet(context){
    return (MediaQuery.sizeOf(context).width >= 800 && MediaQuery.sizeOf(context).width >= 1000);
  }

  static bool isDesktop(context){
    return MediaQuery.sizeOf(context).width >= 1000;
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1000) {
        return desktop;
      } else if (constraints.maxWidth >= 800) {
        return tablet ?? mobile;
      } else {
        return mobile;
      }
    });
  }
}
