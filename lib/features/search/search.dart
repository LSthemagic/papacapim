import 'package:flutter/material.dart';
import 'package:papacapim/components/app_bar.dart';
import 'package:papacapim/components/post_card.dart';
import 'package:papacapim/components/search_card.dart';
import 'package:papacapim/features/post/details.dart';
import 'package:papacapim/features/profile/profile.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade300),
    );
    return Scaffold(
      appBar: CustomAppBar(title: Text("Buscar")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar por nome',
                border: border,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, size: 20),
                prefixIconColor: Colors.grey.shade600,
                enabledBorder: border,
                disabledBorder: border,
                focusedBorder: border,
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ...List.generate(
                  2,
                  (index) => SearchCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfilePage(),
                        ),
                      );
                    },
                  ),
                ),
                ...List.generate(
                  2,
                  (index) => PostCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DetailsPostPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
