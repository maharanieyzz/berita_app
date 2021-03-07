import 'package:flutter/material.dart';
import 'package:task4new/Galery.dart';

class Details extends StatelessWidget {
  final String image;
  final String title;
  final String details;
  final int index;
  Details({
    @required this.image,
    @required this.title,
    @required this.details,
    @required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
            child: Hero(
            tag: 'logo$index',
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
            Container(
              height: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Container(
                        color: Colors.blueAccent,
                        child: Expanded(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => Galery()));
                              },
                                padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                  'Back',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),),
                            ),),
                      ),

                    ],
                  )
                ],
              ),
            ),

          ],
        ),

      ),

   ])) );
  }
}
