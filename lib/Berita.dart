import 'package:flutter/material.dart';
import 'package:task4new/view_berita/login.dart';


void main() {
  runApp(new Berita());
}

class Berita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login(),
        

        color: Colors.blue[200],
        debugShowCheckedModeBanner: false)
    ;
  }
}
