import 'package:flutter/material.dart';
import 'package:review_app/pages/home/home_widgets/home_appbar.dart';

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
      body: SafeArea(
        child: Column(
         children: const <Widget>[
          
         ],
        ),
      ),
    );
  }
}
