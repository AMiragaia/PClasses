import 'package:reppit/services/auth.dart';

class HomePageModel {
  HomePageModel({required this.auth});
  final AuthService auth;

  get user => auth.user;

  int counter = 0;

  void incrementCounter() {
    counter++;
  }
}
