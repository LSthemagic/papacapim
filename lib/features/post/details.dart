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
          PostCard(
            showComments: false,
          ),

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
    );
  }
}
