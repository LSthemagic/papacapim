import 'package:flutter/material.dart';
import 'package:papacapim/components/AppBar.dart';
import 'package:papacapim/components/SearchCard.dart';
import 'package:papacapim/features/post/details.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Buscar")),
      body:ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return SearchCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DetailsPostPage()),
                );
              },
            );
          },
      ),
    );
  }
}
