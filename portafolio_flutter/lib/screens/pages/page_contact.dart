import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portafolio_flutter/const/clipboard_copy.dart';
import 'package:portafolio_flutter/const/theme.dart';
import 'package:portafolio_flutter/provider/loader_provider.dart';
import 'package:portafolio_flutter/widgets/section_container.dart';
import 'package:portafolio_flutter/widgets/text_animated.dart';

class PageContact extends StatelessWidget {
  const PageContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    // final height = MediaQuery.of(context).size.height - 50;
    return SizedBox(
      width: width,
      child: width > 600
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                _FirstSection(),
                _SecondSection(),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                _FirstSection(),
                _SecondSection(),
              ],
            ),
    );
  }
}

class _FirstSection extends StatelessWidget {
  const _FirstSection({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const String text =
        '''Estoy interesado en oportunidades freelance y proyectos desafiantes. Si tienes una propuesta o simplemente quieres saludar, ¡escríbeme!''';
    return SectionWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleAnimated(
              text: "¿Tienes un proyecto en mente?",
              textAlign: TextAlign.start),
          SubTitleAnimated(text: "Conectemos"),
          TextAnimated(text: text, textAlign: TextAlign.start),
          SubTitleAnimated(text: "Telefono:"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextAnimated(text: '54 11-6227-1014', textAlign: TextAlign.start),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () =>
                    clipBoardCopy(text: '54 11-6227-1014', context: context),
                icon: const Icon(
                  Icons.copy,
                  size: 15,
                ),
              )
            ],
          ),
          SubTitleAnimated(text: "Email:"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextAnimated(
                  text: 'francogalbiati984@gmail.com',
                  textAlign: TextAlign.start),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () => clipBoardCopy(
                    text: 'francogalbiati984@gmail.com', context: context),
                icon: const Icon(
                  Icons.copy,
                  size: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _SecondSection extends ConsumerStatefulWidget {
  const _SecondSection({
    // ignore: unused_element
    super.key,
  });
  static final formKey = GlobalKey<FormState>();

  @override
  ConsumerState<_SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends ConsumerState<_SecondSection> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> sendEmail() async {
      if (kIsWeb) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No se puede enviar correos en Flutter Web.")),
        );
        return;
      }

      final Email email = Email(
        recipients: ['francogalbiati984@gmail.com'],
        subject: _nameController.text,
        body: _messageController.text,
        isHTML: false,
      );
      ref.read(loaderProvider.notifier).state = true;
      try {
        await FlutterEmailSender.send(email);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Correo enviado exitosamente.")),
        );
        _emailController.clear();
        _nameController.clear();
        _messageController.clear();
        ref.read(loaderProvider.notifier).state = false;
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al enviar el correo: $error")),
        );
        ref.read(loaderProvider.notifier).state = false;
      }
    }

    return SectionWidget(
      child: Form(
          key: _SecondSection.formKey,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descripcion',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El mensaje no puede estar vacío';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El email no puede estar vacío';
                  }
                  final emailRegex = RegExp(
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                  if (!emailRegex.hasMatch(value)) {
                    return 'Ingresa un email válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mensaje',
                ),
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El mensaje no puede estar vacío';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: secundaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: sendEmail,
                child: Center(
                  child: const Text("Enviar",
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
              )
            ],
          )),
    );
  }
}
