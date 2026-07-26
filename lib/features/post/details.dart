import 'package:flutter/material.dart';
import 'package:papacapim/components/PostCard.dart';
import 'package:papacapim/features/home/home.dart';
import 'package:papacapim/features/post/comment.dart';

class DetailsPostPage extends StatelessWidget {
  const DetailsPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Postagem",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          PostCard(showComments: false),

          const SizedBox(height: 20),

          const Text("Respostas"),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (_, index) {
              return CommentCard();
            },
          ),
        ],
      ),
      bottomSheet: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black12)],
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Escreva uma resposta...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                SizedBox(
                  width: 120,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      minimumSize: const Size(100, 48),
                    ),
                    child: const Text('Enviar'),
                  ),
                ),

                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
