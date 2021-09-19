import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ghost/helpers/validators.dart';
import 'package:lottie/lottie.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key? key,
    required this.onSubmit,
    required this.isLoading,
  }) : super(key: key);
  final bool isLoading;
  final Future<void> Function(
    String name,
    String email,
    String password,
    bool isLogin,
    BuildContext context,
  ) onSubmit;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  bool isLogin = false;

  void validate() {
    final key = _formKey.currentState!;
    FocusScope.of(context).unfocus();
    if (key.validate()) {
      key.save();
      widget.onSubmit(
        name,
        email,
        password,
        isLogin,
        context,
      );
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              isLogin ? "Create An Account" : "Login your Account",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: isLogin ? 250 : 200,
              width: double.infinity,
              child: Lottie.asset(
                isLogin
                    ? "assets/23640-sign-in-or-sign-up-animation.json"
                    : "assets/26436-login-circle.json",
                repeat: false,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!isLogin)
                        TextFormField(
                          key: const ValueKey("name"),
                          validator: (value) => Validator.nameValidator(value!),
                          keyboardType: TextInputType.text,
                          onSaved: (value) => name = value!,
                          decoration: const InputDecoration(
                            labelText: "Full name",
                          ),
                        ),
                      TextFormField(
                        key: const ValueKey("email"),
                        validator: (value) => Validator.emailValidator(value!),
                        onSaved: (value) => email = value!,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                      TextFormField(
                        key: const ValueKey("password"),
                        validator: (value) =>
                            Validator.passwordValidator(value!),
                        onSaved: (value) => password = value!,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      widget.isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(210, 50),
                              ),
                              onPressed: () {
                                validate();
                              },
                              child: Text(isLogin ? "Login" : "Register"),
                            ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          isLogin
                              ? "Create an account"
                              : "Already have an account",
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
