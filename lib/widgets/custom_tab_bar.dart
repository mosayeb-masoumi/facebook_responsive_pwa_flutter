import 'package:facebook_responsive_ui_flutter/config/palette.dart';
import 'package:facebook_responsive_ui_flutter/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onTab;
  final int selectedIndex;
  final bool isBottomIndicator;

  const CustomTabBar(
      {super.key,
      required this.selectedIndex,
      required this.onTab,
      required this.icons,
      this.isBottomIndicator = false});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
          border: isBottomIndicator
              ?const Border(
                  bottom: BorderSide(color: Palette.facebookBlue, width: 3.0),
                )
              :const Border(
                  top: BorderSide(color: Palette.facebookBlue, width: 3.0),
                )),
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                    size: 30.0,
                  ),
                )),
          )
          .values
          .toList(),
      onTap: onTab,
    );
  }
}
