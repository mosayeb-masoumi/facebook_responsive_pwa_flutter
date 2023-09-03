import 'package:facebook_responsive_ui_flutter/data/data.dart';
import 'package:facebook_responsive_ui_flutter/screens/home_screen.dart';
import 'package:facebook_responsive_ui_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return DefaultTabController(
        length: _screens.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  preferredSize: Size(screenSize.width, 100),
                  child: CustomAppBar(
                      currentUser: currentUser,
                      icons: _icons,
                      selectedIndex: _selectedIndex,
                      onTab: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                  ),
                )
              : null,

          /*** in TabBarView  whenever we click on a tab , that screen will be rendered and start from the start**/
          // body: TabBarView(
          //   physics: const NeverScrollableScrollPhysics(),
          //     children: _screens),

          /*************  we used IndexedStack instead of   TabBarView
           *  in home page we have a list and when we scroll down the list and then click on other tab then we click on home tab again ,
           *  we will see the home screen not rendered and show the list position where we left the home *************/
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),

          bottomNavigationBar: !Responsive.isDesktop(context)
              ? Container(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: CustomTabBar(
                      icons: _icons,
                      selectedIndex: _selectedIndex,
                      onTab: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      }),
                )
              : const SizedBox.shrink(),
        ));
  }
}
