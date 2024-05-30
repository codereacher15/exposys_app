import 'package:exposys_internship_app/helper_widgets/data.dart';
import 'package:exposys_internship_app/screens/internship_screen.dart';
import 'package:exposys_internship_app/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ApplyScreen extends StatelessWidget {
  final String title;

  const ApplyScreen(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 95, 31, 148),
          // automaticallyImplyLeading: false,
          actions: [
            TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)),
              child: const Text("Interships Applied"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IntershipScreen()));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                child: const Text("Logout"),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                  });
                },
              ),
            ),
          ]),
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: RawScrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 54, 189, 187),
                              Color.fromARGB(229, 155, 30, 233)
                            ],
                          ),
                        ),
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10.0, right: 10.0),
                          child: Text(
                            softWrap: true,
                            textAlign: TextAlign.left,
                            '${detailScreen[title].toString()} \n\nYou can also apply for an exciting new oppurtunity like this apply now',
                            style: const TextStyle(
                                wordSpacing: 0.5,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  if (!internship_list.contains(title)) {
                    internship_list.add(title);
                  }
                  print(internship_list);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          textAlign: TextAlign.center,
                          'You have successfully applied')));
                },
                child: const Text('Apply Now!!'))
          ],
        ),
      ),
    );
  }
}
