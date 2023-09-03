import 'package:facebook_responsive_ui_flutter/config/palette.dart';
import 'package:facebook_responsive_ui_flutter/model/post_model.dart';
import 'package:facebook_responsive_ui_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: isDesktop ? BorderRadius.circular(10.0): null
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6.0,
                        )
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image.network(
                        "https://images.template.net/wp-content/uploads/2016/05/19142504/Cool-Backgrounds-HD-Download.jpg"),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post: post),
            )
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    "${post.timeAgo} . ",
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 4.0,),
            Expanded(child: Text("${post.likes}", style: TextStyle(color: Colors.grey[600]),)),
            Text("${post.comments} Comments", style: TextStyle(color: Colors.grey[600]),),
            const SizedBox(width: 8.0,),
            Text("${post.shares} Shares", style: TextStyle(color: Colors.grey[600]),),
          ],
        ),

        const Divider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PostButton(
              icon: Icon(MdiIcons.thumbUpOutline , color: Colors.grey[600], size: 20,),
              label: "Like",
              onPressed:(){}
            ),

            _PostButton(
                icon: Icon(MdiIcons.commentOutline , color: Colors.grey[600], size: 20,),
                label: "Comment",
                onPressed:(){}
            ),

            _PostButton(
                icon: Icon(MdiIcons.shareOutline , color: Colors.grey[600], size: 25,),
                label: "Share",
                onPressed:(){}
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onPressed;

  const _PostButton({super.key, required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(  // to show ripple when using inkwel click
        color: Colors.white,
        child: InkWell(
          onTap: onPressed(),
          child:Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0,),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

