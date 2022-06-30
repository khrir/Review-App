import 'package:flutter/material.dart';

Drawer getHomeDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const [
        DrawerHeader(
          child: Text('Upa'),
        ),
      ],
    ),
  );
}
