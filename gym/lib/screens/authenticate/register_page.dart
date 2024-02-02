import 'package:flutter/material.dart';

import 'package:reppit/models/authenticate/register_page_model.dart';

class RegisterPage extends StatefulWidget {
  final Function changeView;

  const RegisterPage({Key? key, required this.changeView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final _model = RegisterPageModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(
        children: [
          const Text('Register'),
          TextButton.icon(
            icon: const Icon(Icons.person),
            label: const Text('Sign In'),
            onPressed: () {
              widget.changeView();
            },
          ),
          Form(
            key: _model.formKey,
            child: Column(
              children: [
                TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: _model
                        .validateEmail, // Use the validator from the model
                    controller: _model.emailController,
                    onSaved: (value) {
                      _model.emailController.text = value!;
                    }),
                TextFormField(
                    decoration: const InputDecoration(labelText: 'Username'),
                    // textEditingController
                    controller: _model
                        .usernameController, // Use the controller from the model
                    onSaved: (value) {
                      _model.usernameController.text = value!;
                    }), // No validation for username
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: _model
                      .validatePassword, // Use the validator from the model
                  controller: _model.passwordController,
                  onSaved: (value) {
                    _model.passwordController.text = value!;
                  },
                ),
                ElevatedButton(
                  onPressed: _model.register,
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
