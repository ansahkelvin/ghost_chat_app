import 'package:flutter/material.dart';
import 'package:ghost/helpers/validators.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  void validate() {
    final key = _formKey.currentState!;
    if (key.validate()) {
      print("Key validated");
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (value) => Validator.nameValidator(value!),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Full name",
                  ),
                ),
                TextFormField(
                  validator: (value) => Validator.emailValidator(value!),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                ),
                TextFormField(
                  validator: (value) => Validator.passwordValidator(value!),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    validate();
                  },
                  child: const Text("Login"),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Create an account",
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
