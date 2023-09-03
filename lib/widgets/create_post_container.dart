import 'package:facebook_responsive_ui_flutter/model/models.dart';
import 'package:facebook_responsive_ui_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      elevation: isDesktop ? 1.0 : 0.0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: isDesktop ? BorderRadius.circular(10.0): null
        ),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl, isActive: false),
                const SizedBox(
                  width: 8.0,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "whats on your mind"),
                  ),
                )
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: const Text(
                      "Live",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const VerticalDivider(
                    width: 8,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: const Text("Photo"),
                  ),
                  const VerticalDivider(
                    width: 8,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: const Text("Room"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
