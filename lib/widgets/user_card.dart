import 'package:facebook_responsive_ui_flutter/model/models.dart';
import 'package:facebook_responsive_ui_flutter/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfileAvatar(imageUrl: user.imageUrl),
            const SizedBox(
              width: 4.0,
            ),
            Flexible(
              child: Text(
                user.name,
                style: const TextStyle(fontSize: 16.0),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            )
          ],
        ),

    );
  }
}
