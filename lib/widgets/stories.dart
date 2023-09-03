import 'package:facebook_responsive_ui_flutter/config/palette.dart';
import 'package:facebook_responsive_ui_flutter/model/story_model.dart';
import 'package:facebook_responsive_ui_flutter/model/user_model.dart';
import 'package:facebook_responsive_ui_flutter/widgets/profile_avatar.dart';
import 'package:facebook_responsive_ui_flutter/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({super.key, required this.currentUser, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      height: 200,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _StoryCard(isAddStory: true, currentUser: currentUser),
              );
            }

            final Story story = stories[index - 1];
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _StoryCard(story: story));
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  const _StoryCard(
      {super.key, this.isAddStory = false, this.currentUser, this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            // isAddStory ? currentUser!.imageUrl : story!.imageUrl,
            isAddStory
                ? "https://images.punkapi.com/v2/24.png"
                : "https://images.punkapi.com/v2/2.png",
            width: 110,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          width: 110,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: Responsive.isDesktop(context)
                  ? const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4.0)
                    ]
                  : null),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: isAddStory
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    // child: Center(
                    child: IconButton(
                        color: Colors.red,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                          color: Palette.facebookBlue,
                        )),
                    // ),
                  )
                : ProfileAvatar(
                    imageUrl: story!.user.imageUrl,
                    hasBorder: !story!.isViewed,
                  )),
        Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              isAddStory ? "Add to story" : story!.user.name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ))
      ],
    );
  }
}
