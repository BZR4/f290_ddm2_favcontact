import 'package:f290_ddm2_favcontacts/model/contact_datasource.dart';
import 'package:f290_ddm2_favcontacts/pages/contact_form.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final contatos = ContatoDataSource.getData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FavContacts')),
      body: ListView.builder(
          itemCount: contatos.length,
          itemBuilder: ((context, index) {
            var contato = contatos[index];

            return Card(
              child: ListTile(
                leading: const CircleAvatar(),
                title: Text(contato.nome),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(contato.telefone), Text(contato.email)],
                ),
              ),
            );
          })),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ContatoForm(),
            ),
          );
        },
        label: const Text('Adicionar'),
      ),
    );
  }
}
