import 'package:flutter/material.dart';

class ImageZoomDialog extends StatelessWidget {
  const ImageZoomDialog({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, // Para que el fondo sea oscuro
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(10), // Bordes redondeados opcionales
        child: Stack(
          children: [
            InteractiveViewer(
              boundaryMargin: EdgeInsets.all(20),
              minScale: 1.0,
              maxScale: 4.0, // Permite hacer zoom hasta 4x
              child: Image.asset(url, fit: BoxFit.contain),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Función para mostrar el diálogo con la imagen en zoom
void showImage({required BuildContext context, required String url}) {
  showDialog(
    context: context,
    builder: (context) => ImageZoomDialog(url: url),
  );
}
