import 'package:app_financeiro/layout/root_layout.dart';
import 'package:app_financeiro/page/opcaologinpage/opcao_login_page.dart';
import 'package:app_financeiro/resources/authentication_methods.dart';
import 'package:app_financeiro/utils/colors.dart';
import 'package:app_financeiro/utils/utils.dart';
import 'package:app_financeiro/widgets/appbar_cadastrologin_widget.dart';
import 'package:app_financeiro/widgets/custom_buttom_widget.dart';
import 'package:app_financeiro/widgets/text_widget.dart';
import 'package:app_financeiro/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    senhaController.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCadastroLoginWidget(
        icon: Icons.arrow_back_ios,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OpcaoLoginPage(),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        text: "Senha",
                        size: 20,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFieldWidget(
                        controller: senhaController,
                        obscureText: true,
                        hintText: "Digite sua senha",
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 380,
                ),
                CustomButtomWidget(
                  color: limeColor,
                  text: "Entrar",
                  colorText: backgroundColor,
                  onTap: () async {
                    String output = await authenticationMethods.login(
                      senha: senhaController.text,
                      email: emailController.text,
                    );

                    if (output == "Sucesso") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootLayout(),
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
