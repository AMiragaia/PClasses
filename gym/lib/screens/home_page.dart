import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:reppit/models/home_page_model.dart';
import 'package:reppit/services/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _model = HomePageModel(auth: AuthService());

  @override
  Widget build(BuildContext context) {
    // get provider of user
    final user = Provider.of<User?>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // logout button
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            onPressed: () async {
              await _model.auth.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('${_model.counter}',
                style: Theme.of(context).textTheme.headlineMedium),
            Text('The current user is: ${user?.displayName ?? "null"}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _model
                .incrementCounter(); // Call the increment method from the model.
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
