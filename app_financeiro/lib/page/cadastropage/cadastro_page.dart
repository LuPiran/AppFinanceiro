import 'dart:developer';

import 'package:app_financeiro/page/loginpage/login_page.dart';
import 'package:app_financeiro/page/opcaocadastropage/opcao_cadastro_page.dart';
import 'package:app_financeiro/resources/authentication_methods.dart';
import 'package:app_financeiro/utils/colors.dart';
import 'package:app_financeiro/utils/utils.dart';
import 'package:app_financeiro/widgets/appbar_cadastrologin_widget.dart';
import 'package:app_financeiro/widgets/custom_buttom_widget.dart';
import 'package:app_financeiro/widgets/text_widget.dart';
import 'package:app_financeiro/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  @override
  void dispose() {
    super.dispose();
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppbarCadastroLoginWidget(
        icon: Icons.arrow_back_ios,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OpcaoCadastroPage(),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        color: Colors.white,
                        text: "Qual o seu email?",
                        size: 20,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFieldWidget(
                        controller: emailController,
                        obscureText: false,
                        hintText: "Digite seu email",
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const TextWidget(
                        color: Colors.white,
                        text: "Crie uma senha",
                        size: 20,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextWidget(
                        color: Colors.grey[400]!,
                        text: "Mínimo de 6 caracteres",
                        size: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFieldWidget(
                        controller: senhaController,
                        obscureText: true,
                        hintText: "******",
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const TextWidget(
                        color: Colors.white,
                        text: "Como podemos te chamar?",
                        size: 20,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFieldWidget(
                        controller: nomeController,
                        obscureText: false,
                        hintText: "Digite seu nome ou apelido?",
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 230,
                ),
                CustomButtomWidget(
                  color: limeColor,
                  text: "Cadastrar",
                  colorText: backgroundColor,
                  onTap: () async {
                    String output = await authenticationMethods.cadastro(
                      nome: nomeController.text,
                      senha: senhaController.text,
                      email: emailController.text,
                    );

                    if (output == "Sucesso") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    } else {
                      Utils().showSnackBar(
                        context: context,
                        content: output,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
