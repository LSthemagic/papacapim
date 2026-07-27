import 'package:flutter/material.dart';
import 'package:papacapim/components/app_bar.dart';
import 'package:papacapim/components/post_card.dart';
import 'package:papacapim/features/home/home.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Perfil"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
            child: const Text("Editar"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundColor: Color.fromARGB(255, 228, 215, 253),
              child: Text("RS"),
            ),
            const Padding(padding: EdgeInsetsGeometry.all(8)),
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
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
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
                  child: Text("12 publicações"),
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
                itemCount: 1,
                itemBuilder: (context, index) {
                  return PostCard(
                    onTap: () {
                      
                    },
                    padding: EdgeInsetsGeometry.directional(top: 16),
                  );
                } 
              ),
            
            )
          ],
        ),
      ),
    );
  }
}
