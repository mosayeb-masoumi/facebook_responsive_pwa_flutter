import 'package:facebook_responsive_ui_flutter/config/palette.dart';
import 'package:facebook_responsive_ui_flutter/model/user_model.dart';
import 'package:facebook_responsive_ui_flutter/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionList extends StatelessWidget {
  final List<List> _moreOptionList = [
    [MdiIcons.sackOutline, Colors.deepPurple, "Covid 19 info Center"],
    [MdiIcons.accountMultiple, Colors.cyan, "Friends"],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, "Messenger"],
    [MdiIcons.flag, Colors.orange, "Pages"],
  ];

  final User currentUser;

  MoreOptionList({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
          itemCount: 1 + _moreOptionList.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: UserCard(
                  user: currentUser,
                ),
              );
            }

            final List option = _moreOptionList[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _Option(
                icon: option[0],
                color: option[1],
                label: option[2],
              ),
            );
          }),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _Option(
      {super.key,
      required this.icon,
      required this.color,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: color,
          ),
          const SizedBox(
            width: 6.0,
          ),
          Flexible(
              child: Text(
            label,
            style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
          ))
        ],
      ),
    );
  }
}
