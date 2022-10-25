import 'package:flutter/material.dart';

class ContatoForm extends StatefulWidget {
  const ContatoForm({super.key});

  @override
  State<ContatoForm> createState() => _ContatoFormState();
}

class _ContatoFormState extends State<ContatoForm> {
  final controllerNome = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerTelefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const url =
        'https://images.pexels.com/photos/7693587/pexels-photo-7693587.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar')),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              print('Evento CircleAvatar');
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: CircleAvatar(
                radius: 80,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(url),
                ),
              ),
            ),
          ),
          CustomTextField(
            labelText: 'Nome',
            iconData: Icons.text_fields,
            controller: controllerNome,
          ),
          CustomTextField(
            labelText: 'E-mail',
            iconData: Icons.email,
            controller: controllerEmail,
          ),
          CustomTextField(
            labelText: 'Telefone',
            iconData: Icons.smartphone,
            controller: controllerTelefone,
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 48,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('SALVAR'),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData iconData;

  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.iconData,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: Icon(iconData),
          labelText: labelText,
        ),
      ),
    );
  }
}
