import 'package:flutter/material.dart';
import 'package:task4new/Berita.dart';
import 'package:task4new/Galery.dart';
import 'package:task4new/Kamus.dart';
import 'package:task4new/view_berita/home.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView (
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.account_circle, size: 70, color: Colors.blue,),
                    SizedBox(height: 15,),
                    Text("LatihanDrawer@gmail.com"),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text ("Home"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),ListTile(
                title: Text ("Galery"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Galery()));
                },
              ),
              ListTile(
                title: Text ("Dictionary"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Kamus()));
                },
              ),
              ListTile(
                title: Text ("News"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePageBerita()));
                },
              ),
            ],
          )
      ),
   appBar: AppBar(
        title: Text('Kamus Peternakan'),
     backgroundColor: Colors.blueAccent),
   body: Center(
     child: Column(
     children: <Widget>[
       Container(
         padding: EdgeInsets.all(10.0),
         child: MaterialButton(
           child: Text("Galery"),
           onPressed: () {
             Navigator.pop(context);
             Navigator.push(context, MaterialPageRoute(
               builder: (context) =>Galery(),
             ),);

           },
           color: Colors.lightBlueAccent,
           textColor: Colors.white,
         ),
       ),
       Container(
         padding: EdgeInsets.all(10.0),
         child: MaterialButton(
           child: Text("Kamus Istilah Peternakan"),
           onPressed: (){Navigator.push(context, MaterialPageRoute(
               builder:(context) => Kamus(),
           ));
           },
           color: Colors.lightBlueAccent,
           textColor: Colors.white,
         ),
       ),
  //     Container(
  //       padding: EdgeInsets.all(10.0),
   //      child:
         MaterialButton(
           child: Text("Berita Peternakan"),
           onPressed: (){Navigator.push(context, MaterialPageRoute(
               builder:(context) => Berita()
           ));
           },
           color: Colors.lightBlueAccent,
           textColor: Colors.white,
         ),
       //),
     ],
     ),
   ),
    );
  }
}

