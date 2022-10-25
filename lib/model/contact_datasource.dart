import 'package:f290_ddm2_favcontacts/model/contato.dart';

class ContatoDataSource {
  static List<Contato> getData() {
    return [
      Contato(
        nome: 'Esdras B Silva',
        email: 'bzr4@icloud.com',
        telefone: '19 999613381',
      ),
      Contato(
        nome: 'Erika G S Silva',
        email: 'erika@icloud.com',
        telefone: '19 999997777',
      ),
      Contato(
        nome: 'Enzo G S Silva',
        email: 'enzo@icloud.com',
        telefone: '19 888887766',
      ),
      Contato(
        nome: 'Frodo B Silva',
        email: 'frodo@icloud.com',
        telefone: '19 999996655',
      ),
      Contato(
        nome: 'Alvin B Silva',
        email: 'alvin@icloud.com',
        telefone: '19 988887744',
      ),
    ];
  }
}
