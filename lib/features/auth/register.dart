import 'package:flutter/material.dart';
import 'package:papacapim/components/app_bar.dart';
import 'package:papacapim/core/utils/app_snackbar.dart';
import 'package:papacapim/core/validators/validators.dart';
import 'package:papacapim/features/auth/controllers/register_controller.dart';
import 'package:papacapim/features/auth/login.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final loginController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  final registerController = RegisterController();

  Future<void> register() async {
    print("ta aq");
    final success = await registerController.register(
      login: loginController.text,
      name: nameController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );

    if (!mounted) return;

    if (success) {
      AppSnackBar.show(context, "Cadastro Realizado!");
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    } else {
      AppSnackBar.show(
        context,
        registerController.error ?? 'Erro ao cadastrar',
      );
    }
  }

  @override
  void initState() {
    super.initState();

    registerController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    loginController.dispose();
    nameController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    registerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Criar Conta"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
            child: const Text("Entrar"),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nome",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: nameController,
                      validator: Validators.required,
                      decoration: const InputDecoration(
                        hintText: "Digite seu nome",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: loginController,
                      validator: Validators.login,
                      decoration: const InputDecoration(
                        hintText: "seu_login",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Senha",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      validator: Validators.required,
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "*********",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Confirmar senha",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      validator: Validators.required,
                      controller: passwordConfirmationController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "*********",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          if (!registerController.isLoading) {
                            register();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: registerController.isLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                "Cadastrar",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
