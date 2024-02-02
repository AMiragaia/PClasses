import 'package:flutter/material.dart';
import 'package:reppit/models/authenticate/signin_page_model.dart';

class SignInPage extends StatefulWidget {
  final Function changeView;

  const SignInPage({Key? key, required this.changeView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  final _model = SignInPageModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
        child: Container(
          key: const Key('login_form'),
          child: Form(
            key: _model.formKey, // Added the formKey from the model
            child: Column(
              children: [
                const Text('Sign In'),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  validator:
                      _model.validateEmail, // Use the validator from the model
                  controller: _model
                      .emailController, // Use the controller from the model
                  onSaved: (value) {
                    _model.emailController.text = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  validator: _model
                      .validatePassword, // Use the validator from the model
                  controller: _model
                      .passwordController, // Use the controller from the model
                  onSaved: (value) {
                    _model.passwordController.text = value!;
                  },
                ),
                ElevatedButton(
                  onPressed: _model
                      .signIn, // Call the signIn method when the button is pressed
                  child: const Text('Sign In'),
                ),
                TextButton(
                  child: const Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onPressed: () {
                    widget.changeView();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
