import 'package:flutter/material.dart';
import 'package:review_app/pages/app_bar/app_bar.dart';
import 'package:review_app/pages/home/home_widgets/home_content.dart';
import 'package:review_app/pages/home/home_widgets/home_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar(),
      drawer: getHomeDrawer(),
      body: const HomePageContent(),
    );
  }
}
