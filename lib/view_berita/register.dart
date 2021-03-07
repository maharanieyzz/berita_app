import 'package:flutter/material.dart';
import 'package:task4new/view_berita/home.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
 TextEditingController username = TextEditingController();
 TextEditingController email = TextEditingController();
 TextEditingController phone = TextEditingController();
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
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    icon: Icon(Icons.email, size: 35),
                    labelText: 'Enter your email',
                    hintText: "Email"),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: phone,
                decoration: InputDecoration(
                    icon: Icon(Icons.phone, size: 35),
                    labelText: 'Enter your phone number',
                    hintText: "Phone Number"),
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
                  Text('Register',style: TextStyle(color: Colors.white, fontSize: 18 ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

