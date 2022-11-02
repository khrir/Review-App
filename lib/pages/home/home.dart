import 'package:flutter/material.dart';
import 'package:review_app/pages/home/home_widgets/app_bar/app_bar.dart';
import 'package:review_app/pages/home/home_widgets/floating_action_button/floating_action_button.dart';
import 'package:review_app/pages/home/home_widgets/home_content.dart';
import 'package:review_app/pages/home/home_widgets/home_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: getFloatingActionButton(context),
      appBar: getHomeAppBar(),
      drawer: getHomeDrawer(context),
      body: const HomePageContent(),
    );
  }
}