class UserModel {
  final String nome;

  UserModel({required this.nome});

  Map<String, dynamic> getJson() => {
        'nome': nome,
      };
}


