import 'package:flutter/material.dart';
import 'package:papacapim/components/AppBar.dart';
import 'package:papacapim/components/PostCard.dart';
import 'package:papacapim/features/auth/Login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool allActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Papacampim"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
            child: const Text("Sair"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 12),
              child: SizedBox(
                height: 38,
                child: Row(
                  spacing: 4,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          allActive = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: allActive
                            ? Colors.deepPurple
                            : Colors.white,
                        foregroundColor: allActive
                            ? Colors.white
                            : Colors.black,
                        minimumSize: const Size(40, 32),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: const Text("Todos"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          allActive = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: allActive
                            ? Colors.white
                            : Colors.deepPurple,
                        foregroundColor: allActive
                            ? Colors.black
                            : Colors.white,
                        minimumSize: const Size(40, 32),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: const Text("Seguindo"),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return PostCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
