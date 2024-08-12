import 'package:brew_crew/shared/constent_value.dart';
import 'package:flutter/material.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({super.key});

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: textInputDecoration,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
                onChanged: (value) => setState(() {
                  _currentName = value;
                }),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButton(
                items: sugars
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text('${e} suger'),
                        value: e,
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() {
                  _currentSugars = value;
                }),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  print(_currentName);
                  print(_currentSugars);
                  print(_currentStrength);
                },
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
