
import 'package:flutter/material.dart';

class FooterCard extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const FooterCard({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Colors.transparent,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_outlined, color: Colors.deepPurpleAccent),
          label: 'Início',
        ),
        NavigationDestination(
          icon: Icon(Icons.search_outlined),
          selectedIcon: Icon(Icons.search, color: Colors.deepPurpleAccent),
          label: 'Buscar',
        ),
        NavigationDestination(
          icon: Icon(Icons.add),
          selectedIcon: Icon(Icons.add, color: Colors.deepPurpleAccent),
          label: 'Publicar',
        ),
      ],
    );
  }
}
