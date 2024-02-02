import 'package:flutter/material.dart';

import 'package:reppit/app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';

import 'package:reppit/services/auth.dart';
import 'package:reppit/app/wrapper.dart';

class Reppit extends StatelessWidget {
  const Reppit({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          name: "reppit",
          options: DefaultFirebaseOptions.options,
        ),
        builder: (context, snapshot) {
          // if (!snapshot.hasData) return const CircularProgressIndicator();
          if (snapshot.hasError) {
            print(snapshot.error);
            return const MaterialApp(
              title: 'Reppit',
              home: Scaffold(
                body: Center(
                  child: Text('Error'),
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider<User?>.value(
              value: AuthService().user,
              initialData:
                  null, // this will inform the wrapper that the user is not logged in
              child: const MaterialApp(
                home: Wrapper(), // wrapper will decide which screen to show
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
