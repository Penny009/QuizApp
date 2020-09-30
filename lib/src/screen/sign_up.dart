import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/notifiers/auth_notifiers.dart';
import 'package:quiz_app/services/auth_services.dart';
import 'package:quiz_app/src/model/user.dart';
import 'package:quiz_app/src/screen/home.dart';

class SignUp extends StatefulWidget {
  static final String id = 'signup';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();

  User user = User();

  void _submit() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    signup(user, authNotifier);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Gbeborun',
                style: TextStyle(fontSize: 50, fontFamily: 'Billabong'),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Name"),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Display Name is required';
                          }

                          if (value.length < 5 || value.length > 12) {
                            return 'Display Name must be betweem 5 and 12 characters';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          user.name = value;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Email"),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Email is required';
                          }

                          if (!RegExp(
                                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          user.email = value;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Password"),
                        controller: _passwordController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Password is required';
                          }

                          if (value.length < 5 || value.length > 20) {
                            return 'Password must be betweem 5 and 20 characters';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          user.password = value;
                        },
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: "Confirm Password"),
                        validator: (String value) {
                          if (_passwordController.text != value) {
                            return 'Passwords do not match';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          user.password = value;
                        },
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: FlatButton(
                        color: Colors.blue,
                        onPressed: _submit,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: FlatButton(
                        color: Colors.blue,
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Back to Login',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
