import 'package:flutter/material.dart';
import 'package:tech_ecommerce/controllers/user_controller.dart';
import 'package:tech_ecommerce/ui/pages/login.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  SignIn({super.key});
  UserController userController = UserController();
  final nomeController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(toolbarHeight: 260,
      backgroundColor: Colors.black,
        flexibleSpace: const Opacity(
          opacity: 0.2,
          child: Image(
            image: AssetImage('lib/images/header.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        title: const Center(child: Text("Ecommerce", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600, color: Colors.white))),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                        children: [
                        const Text("Bem-vindo(a) à nossa loja de tecnologia!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 20),
                        const Text("Por favor, preencha os campos abaixo com suas informações para criar sua conta e começar a explorar nossos produtos incríveis, ou então se já possui uma faça login clicando em 'Login'."),
                        const SizedBox(height: 20),
                          Form(
                            child: Column(
                                children: [
                                  TextFormField(
                                    controller: nomeController,
                                    decoration: const InputDecoration(
                                        hintText: 'Usuário', border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                        hintText: 'Senha', border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      userController.signIn(context, nomeController.text, passwordController.text);
                                    },
                                    child: const Text('Cadastrar-se', style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Já possui uma conta?',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (_) => Login()),
                                        (route) => false,
                                      );
                                    },
                                    child: const Text('Login', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
                                  ),
                                ),
                                ],
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            )
          ],
      ),
    );
  }
}