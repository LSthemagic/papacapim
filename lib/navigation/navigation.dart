import 'package:flutter/material.dart';
import 'package:papacapim/components/footer.dart';
import 'package:papacapim/features/home/home.dart';
import 'package:papacapim/features/post/post.dart';
import 'package:papacapim/features/profile/profile.dart';
import 'package:papacapim/features/search/search.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;

  final pages = const [
    HomePage(),
    SearchPage(),
    PostPage(),
    ProfilePage(isAuthor: true,)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: FooterCard(
        currentIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}