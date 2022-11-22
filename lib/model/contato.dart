class Contato {
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? urlImagem;

  static String tabela = 'contatos';
  static String colunaId = 'id';
  static String colunaNome = 'nome';
  static String colunaEmail = 'email';
  static String colunaTelefone = 'telefone';
  static String colunaUrlImagem = 'caminhoImagem';

  Contato(
      {required this.nome, this.email, required this.telefone, this.urlImagem});

  Contato.fromMap(Map<String, dynamic> map)
      : id = map[colunaId] as int,
        nome = map[colunaNome] as String,
        email = map[colunaEmail] as String,
        telefone = map[colunaTelefone] as String,
        urlImagem = map[colunaUrlImagem] as String;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      colunaNome: nome,
      colunaEmail: email,
      colunaTelefone: telefone,
      colunaUrlImagem: urlImagem
    };

    if (id != null) {
      map[colunaId] = id;
    }

    return map;
  }
}
