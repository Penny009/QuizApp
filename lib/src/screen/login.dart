import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/notifiers/auth_notifiers.dart';
import 'package:quiz_app/services/auth_services.dart';
import 'package:quiz_app/src/model/user.dart';
import 'package:quiz_app/src/screen/sign_up.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  User user = User();

  void _submit() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    login(user, authNotifier);
  }

  void initState() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
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
                        onSaved: (String value) => user.email = value,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Password"),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: FlatButton(
                        color: Colors.blue,
                        onPressed: _submit,
                        child: Text(
                          'Login',
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
                        onPressed: () =>
                            Navigator.pushNamed(context, SignUp.id),
                        child: Text(
                          'Create an Account',
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
