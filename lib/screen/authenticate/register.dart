import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class Register extends StatefulWidget {
  const Register({required this.toogleview, super.key});
  final Function() toogleview;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  String _email = "";
  String _pass = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up to Brew Crew"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
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
                  "Register",
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
