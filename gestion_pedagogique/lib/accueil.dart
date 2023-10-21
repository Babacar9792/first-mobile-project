import 'package:flutter/material.dart';
import 'package:gestion_pedagogique/main.dart';

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  int _selectedIndex = 0; // Index du bouton actuellement sélectionné

  // Les écrans associés à chaque bouton
  final List<Widget> _screens = [
    ProfilPage(),
    SessionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'Accueil'),
      ),
      body: _screens[_selectedIndex], // Afficher l'écran correspondant à l'index sélectionné
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Sessions',
          ),
        ],
        currentIndex: _selectedIndex, // Index du bouton sélectionné
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page Profil'),
    );
  }
}

class SessionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page Sessions'),
    );
  }
}