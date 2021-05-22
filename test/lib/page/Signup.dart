import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './Authenticated.dart';
// import './../widget//sign_up_widget.dart';
import './../widget/sign_up_widget.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email;
  String password;
  String firstName;
  String lastName;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 60),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (txt) {
                    firstName = txt;
                  },
                  decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(height: 20.0),
                TextField(
                  onChanged: (txt) {
                    lastName = txt;
                  },
                  decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                TextField(
                  onChanged: (txt) {
                    email = txt;
                  },
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(height: 5.0),
                TextField(
                  onChanged: (txt) {
                    password = txt;
                  },
                  decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  obscureText: true,
                ),
                SizedBox(height: 40.0),
                GestureDetector(
                  onTap: () async {
                    var headers = {
                      'Content-Type': 'application/json',
                      'Cookie':
                          'connect.sid=s%3ArNYeqyWmU1nKKAhyOJboYP8rwLW0nKv2.LhiT4zS6d%2Fqo8cuYyMeoIb0o6isiM9muC6AnH%2F%2FOvtY'
                    };
                    var request = http.Request(
                        'POST',
                        Uri.parse(
                            'https://aqueous-thicket-70637.herokuapp.com/auth/register'));
                    request.body = json.encode({
                      "email": email,
                      "password": password,
                      "firstName": firstName,
                      "lastName": lastName
                    });
                    request.headers.addAll(headers);

                    http.StreamedResponse response = await request.send();

                    if (response.statusCode == 200) {
                      print(await response.stream.bytesToString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (SignUpWidget())),
                      );
                    } else {
                      print(response.reasonPhrase);
                    }
                  },
                  child: Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: Center(
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //     color: Colors.black,
                        //     style: BorderStyle.solid,
                        //     width: 1.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(width: 10.0),
                        // Center(
                        //   child: Text('Log in with facebook',
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           fontFamily: 'Montserrat')),
                        // )
                      ],
                    ),
                  ),
                )
              ],
            )),
        SizedBox(height: 15.0),
      ],
    ));
  }

  Widget buildSignUp() => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                'Welcome Back To MyApp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(height: 12),
          Text(
            'Login to continue',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
        ],
      );
}
