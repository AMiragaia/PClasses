import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:reppit/screens/authenticate/authenticate.dart';
import 'package:reppit/screens/home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    print("user: $user");
    if (user != null) {
      // if user is logged in
      return const HomePage(title: "Home Page");
    } else {
      // if user is not logged in
      return const AuthenticatePage(
          key: Key("authenticate"), title: "Authenticate");
    }
  }
}
