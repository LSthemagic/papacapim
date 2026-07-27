import 'package:flutter/material.dart';
import 'package:papacapim/components/post_card.dart';
import 'package:papacapim/features/post/comment.dart';

class DetailsPostPage extends StatefulWidget {
  const DetailsPostPage({super.key});

  @override
  State<DetailsPostPage> createState() => _DetailsPostPageState();
}

class _DetailsPostPageState extends State<DetailsPostPage> {
  final _replyController = TextEditingController();

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Postagem",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const PostCard(showComments: false),

          const SizedBox(height: 20),

          const Text("Respostas"),

          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (_, index) => const CommentCard(),
            ),
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
                    controller: _replyController,
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
                    onPressed: () {
                      if (_replyController.text.trim().isEmpty) return;
                      _replyController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Resposta enviada!")),
                      );
                    },
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
