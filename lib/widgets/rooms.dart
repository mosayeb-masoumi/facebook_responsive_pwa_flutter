import 'package:facebook_responsive_ui_flutter/config/palette.dart';
import 'package:facebook_responsive_ui_flutter/model/user_model.dart';
import 'package:facebook_responsive_ui_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDesktop ? BorderRadius.circular(10.0): null
      ),
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: _CreateRoomButton(),
              );
            }

            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          side: const BorderSide(width: 3, color: Colors.blueAccent),
          textStyle:const TextStyle(color: Palette.facebookBlue)),
      child:const Row(
        children: [
          Icon(
            Icons.video_call,
            color: Colors.purple,
          ),
           SizedBox(
            width: 4,
          ),
          Text("Create\nRoom")
        ],
      ),
    );
  }
}
