import 'package:flutter/material.dart';
import 'package:review_app/pages/app_bar/app_bar.dart';
import 'package:review_app/pages/home/home_widgets/home_bottom_navigation.dart';
import 'package:review_app/pages/home/home_widgets/home_content.dart';
import 'package:review_app/pages/home/home_widgets/home_drawer.dart';
import 'package:review_app/pages/profile/profile_page.dart';
import 'package:review_app/pages/sobrereview/sobrereview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: getHomeAppBar(),
      drawer: getHomeDrawer(context),
      body: PageView(
        controller: pageViewController,
        children: const [
          HomePageContent(),
          ProfilePage(),
          Sobrereview(),
        ],
      ),
      bottomNavigationBar: getHomeBottomNavigation(pageViewController),
    );
  }
}
