import 'package:flutter/material.dart';
import 'package:papacapim/components/app_bar.dart';
import 'package:papacapim/components/post_card.dart';
import 'package:papacapim/features/profile/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.isAuthor = false});
  final bool isAuthor;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool seguindo = false;
  final List<int> _postIds = [1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Perfil"),
        actions: widget.isAuthor
            ? [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EditProfilePage(),
                      ),
                    );
                  },
                  child: const Text("Editar"),
                ),
              ]
            : [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundColor: Color.fromARGB(255, 228, 215, 253),
              child: Text("RS"),
            ),
            const Padding(padding: EdgeInsetsGeometry.all(8)),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      child: Text("Railan Santana"),
                    ),
                    Text(
                      "@railan_santanaa",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                if (!widget.isAuthor)
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        seguindo = !seguindo;
                      });
                    },
                    child: Text(seguindo ? 'Seguindo' : 'Seguir'),
                  ),
              ],
            ),

            const Padding(padding: EdgeInsetsGeometry.all(8)),
            Row(
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  child: Text("12 seguindo"),
                ),
                const Padding(padding: EdgeInsetsGeometry.all(8)),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  child: Text("81 seguidores"),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _postIds.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    isAuthor: widget.isAuthor,
                    onTap: () {},
                    padding: EdgeInsetsGeometry.directional(top: 16),
                    onDelete: () {
                      setState(() {
                        _postIds.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Postagem excluída"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
