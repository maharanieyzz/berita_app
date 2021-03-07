import 'package:flutter/material.dart';
import 'package:task4new/view_berita/home.dart';
import 'package:task4new/view_berita/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                    icon: Icon(Icons.person, size: 35),
                    labelText: 'Enter your username',
                    hintText: "Username"),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock, size: 35),
                  labelText: 'Enter your password',
                  hintText: "Password",),
                controller: pass,

              ),
              Container(
                margin: EdgeInsets.all(15.0,),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePageBerita()),
                    );

                  },
                  child:
                  Text('Login',style: TextStyle(color: Colors.white, fontSize: 18 ),),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Did not have an account? ',
                        style: TextStyle(color: Colors.grey[700])),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.blue,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.underline,
                            fontSize: 16.0),
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

