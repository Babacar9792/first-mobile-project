// import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Page de connexion"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: 20),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Mot de passe',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Ajoutez ici la logique de connexion
//               },
//               child: Text('Se connecter'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse(
          'http://127.0.0.1:8000/odc-api/login'), // URL de votre API Laravel
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    String responseBody =
        response.body; // Remplacez ceci par votre réponse JSON réelle.

// Décoder la réponse JSON.
    final Map<String, dynamic> jsonResponse = json.decode(responseBody);

// Accédez aux différentes parties de la réponse.
    String message = jsonResponse['message'];
    bool status = jsonResponse['status'];

    // Connexion réussie
    // print(response);
    // ignore: avoid_print
    // print(status);
    if (status == true) {
      print("page d'accueil");
      Navigator.pushNamed(context, '/acueille');
    } else {
      // print("message d'erreur");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );

      // ScaffoldMessenger.of(context).showMaterialBanner();
    }
    // Vous pouvez analyser la réponse JSON si l'API renvoie des données utilisateur

    // Échec de la connexion
    // print(response);
    // Vous pouvez gérer les erreurs ici
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
              ),
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}
