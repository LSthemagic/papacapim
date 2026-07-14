import 'package:flutter/material.dart';
import 'package:papacapim/features/auth/Login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomePage',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            TextButton(onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage())
              );
            }, child: const Text("sair"))
          ],
        ),
        body: Center(
          child: Text('Hello, HomePage!'),
        ),
      ),
    );
  }
}