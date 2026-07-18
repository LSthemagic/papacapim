import 'package:flutter/material.dart';
import 'package:papacapim/components/AppBar.dart';
import 'package:papacapim/features/home/home.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Nova postagem"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
              );
            },
            child: Text("cancelar", style: TextStyle(color: Colors.deepPurple)),
          ),
        ],
      ),
    );
  }
}
