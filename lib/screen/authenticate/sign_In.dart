// import 'package:brew_crew/screen/authenticate/authenticate.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constent_value.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({required this.toogleview, super.key});
  final Function() toogleview;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String _email = "";
  String _pass = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In to Brew Crew"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              widget.toogleview();
            },
            label: Text("Sign in"),
            icon: Icon(Icons.person),
          )
        ],
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (value) => value!.isEmpty ? 'Enter an email' : null,
                onChanged: (newValue) {
                  setState(() {
                    _email = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (value) => value!.length < 6
                    ? 'Enter password six charecter long'
                    : null,
                onChanged: (newValue) {
                  setState(() {
                    _pass = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result =
                        await _auth.signInWithEmailPass(_email, _pass);
                    if (result == null) {
                      setState(() {
                        error = 'please enter valid input';
                      });
                    }
                  }
                },
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
