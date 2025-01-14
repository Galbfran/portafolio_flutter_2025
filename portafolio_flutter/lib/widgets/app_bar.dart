import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      elevation: 5,
      actions: [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
