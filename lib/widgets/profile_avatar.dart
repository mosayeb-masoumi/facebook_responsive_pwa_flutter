import 'package:facebook_responsive_ui_flutter/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar(
      {super.key, required this.imageUrl, this.isActive = false , this.hasBorder = false});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17 : 20,
            backgroundColor: Colors.grey[200],
            backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/40134233?v=4"),
            // backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
          ),
        ),
        isActive? Positioned(
            bottom: 0, right: 0,
            child: Container(
              height: 15,
              width: 15,
              decoration: const BoxDecoration(
                color: Palette.online,
                shape: BoxShape.circle
              ),
            )):const SizedBox.shrink()
      ],
    );
  }
}
