import 'package:app_financeiro/model/user_model.dart';
import 'package:app_financeiro/resources/cloudfirestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreMethods cloudFirestoreMethods = CloudFirestoreMethods();

  //Cadastro
  Future<String> cadastro({
    required String nome,
    required String senha,
    required String email,
  }) async {
    nome.trim();
    senha.trim();
    email.trim();
    String output = "Algo deu errado";
    if (nome != "" && email != "" && senha != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: senha,
        );
        UserModel user = UserModel(
          nome: nome,
        );
        await cloudFirestoreMethods.uploadNameAndAddressToDatabase(
          user: user,
        );
        output = "Sucesso";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Por favor preencha todos os campos!";
    }
    return output;
  }

  //Login
  Future<String> login({
    required String senha,
    required String email,
  }) async {
    senha.trim();
    email.trim();
    String output = "Algo deu errado";
    if (email != "" && senha != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: senha,
        );
        output = "Sucesso";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Por favor preencha todos os campos!";
    }
    return output;
  }
}
