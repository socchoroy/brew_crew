// import 'package:brew_crew/screen/authenticate/authenticate.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({required this.toogleview, super.key});
  final Function() toogleview;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text("E mail"),
                ),
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text("Password"),
                ),
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
                onPressed: () {},
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.yellow),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
