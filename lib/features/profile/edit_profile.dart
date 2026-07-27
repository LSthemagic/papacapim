import 'package:flutter/material.dart';
import 'package:papacapim/components/app_bar.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
          title: Text("Editar Perfil"),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: const Text("Cancelar"))
          ],
        ),
        body: Center(
          child: Scaffold(
            body: Container(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nome",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Railan Santana",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Nome de usuário",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "railan_santanaa",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(height: 8),
                    const Text(
                      "Nova senha",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
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
                      "Confirmar nova senha",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
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
                        onPressed: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => const HomePage(),
                          //   ),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Salvar alterações",
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