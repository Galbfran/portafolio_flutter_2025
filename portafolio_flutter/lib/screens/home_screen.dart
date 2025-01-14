import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CardProyect(),
            const Center(
              child: Text(
                'Bienvenido a mi portafolio',
                style: TextStyle(fontSize: 20, fontFamily: "Franklin"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardProyect extends StatelessWidget {
  const CardProyect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      title: TextHover(),
      actions: [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class TextHover extends StatefulWidget {
  const TextHover({super.key});

  @override
  State<TextHover> createState() => _TextHoverState();
}

class _TextHoverState extends State<TextHover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(
          color: isHovered ? Colors.grey : Colors.amber,
          fontSize: isHovered ? 20 : 18,
          fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
        ),
        child: const Text('Portafolio Galbiati Franco'),
      ),
    );
  }
}
