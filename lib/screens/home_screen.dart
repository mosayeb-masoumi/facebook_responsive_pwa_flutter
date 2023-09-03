import 'package:facebook_responsive_ui_flutter/data/data.dart';
import 'package:facebook_responsive_ui_flutter/model/models.dart';
import 'package:facebook_responsive_ui_flutter/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:facebook_responsive_ui_flutter/config/palette.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // when responsive from desktop to mobile or vise versa
  // the home list wont rendered and show list fro the position that we left and move to desktop
   final TrackingScrollController _trackingScrollController =  TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: SafeArea(
              child: Responsive(
        mobile: _HomeScreenMobile(scrollController: _trackingScrollController),
        desktop: _HomeScreenDesktop(scrollController: _trackingScrollController),
      ))),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController? scrollController;
  const _HomeScreenMobile({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Facebook",
            style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(icon: Icons.search, iconSize: 30.0, onPressed: () {}),
            CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () {}),
          ],
        ),

        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),

        //show posts
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          final Post post = posts[index];
          return PostContainer(post: post);
        }, childCount: posts.length))
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenDesktop({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(padding: const EdgeInsets.all(12.0),
                child: MoreOptionList(currentUser: currentUser),
              ),
            )),
        const Spacer(),
        SizedBox(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
              ),

              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),

              //show posts
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              }, childCount: posts.length))
            ],
          ),
        ),
        const Spacer(),
        Expanded(
            flex: 2,
            child:Align(
              alignment: Alignment.centerRight,
              child: Padding(padding: const EdgeInsets.all(12.0),
                child: ContactList(users: onlineUsers),
              ),
            )),
      ],
    );
  }
}
