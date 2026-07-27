import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    this.onTap,
    this.onDelete,
    this.isAuthor = false,
    this.showComments = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool isAuthor;
  final bool showComments;
  final EdgeInsetsGeometry padding;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;

  Future<void> _confirmDelete(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Excluir postagem"),
        content: const Text("Tem certeza que deseja excluir esta postagem?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text("Excluir"),
          ),
        ],
      ),
    );

    if (confirm == true && widget.onDelete != null) {
      widget.onDelete!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color.fromARGB(255, 228, 215, 253),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Maria Silva",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "@maria",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (widget.isAuthor)
                      IconButton(
                        onPressed: () => _confirmDelete(context),
                        icon: Icon(
                          Icons.delete_outline,
                          size: 18,
                          color: Colors.grey.shade600,
                        ),
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        tooltip: "Excluir postagem",
                      ),
                  ],
                ),

                const SizedBox(height: 12),

                const Text(
                  "Hoje comecei meu primeiro projeto com Flutter. Muito feliz!",
                  style: TextStyle(fontSize: 13),
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          liked = !liked;
                        });
                      },
                      icon: Icon(
                        liked ? Icons.favorite : Icons.favorite_border,
                        size: 16,
                        color: liked ? Colors.red : Colors.grey.shade600,
                      ),
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      liked ? "13" : "12",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    if (widget.showComments) ...[
                      const SizedBox(width: 20),

                      Icon(
                        Icons.chat_bubble_outline,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "4",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
