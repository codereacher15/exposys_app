import 'package:exposys_internship_app/helper_widgets/data.dart';
import 'package:exposys_internship_app/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IntershipScreen extends StatefulWidget {
  @override
  State<IntershipScreen> createState() => _IntershipScreenState();
}

class _IntershipScreenState extends State<IntershipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,

          backgroundColor: const Color.fromARGB(255, 95, 31, 148),
          actions: [
            TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)),
              child: const Text("Logout"),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Signed Out')));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                });
              },
            ),
          ]),
      body: internship_list.isEmpty
          ? const Center(
              child: Text(
                  'No interships applied, Hurry Up and Grap your chance!',
                  style: TextStyle(fontWeight: FontWeight.bold)))
          : ListView.builder(
              itemCount: internship_list.length,
              itemBuilder: (BuildContext ctx, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    setState(() {
                      internship_list.removeAt(index);
                    });
                  },
                  background: Container(
                    color: Colors.red,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: ListTile(
                      title: Text(internship_list[index]),
                      trailing: const Icon(Icons.arrow_back),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
