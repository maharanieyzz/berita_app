import 'package:flutter/material.dart';
import 'package:task4new/Kamus.dart';
import 'package:task4new/main.dart';
import 'package:task4new/view_berita/home.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'detail.dart';


List<ImageDetails> _images = [
  ImageDetails(
      image: 'img/sapi.jpg',
      title: 'Sapi',
      details: 'Sebagai hewan ternak sapi dapat menghasilkan daging, susu, kulit, tenaga dan pupuk.'),

  ImageDetails(
      image: 'img/kambing.jpg',
      title: 'Kambing',
      details: 'Sebagai hewan ternak Kambing dapat menghasilkan daging dan susu.'),

  ImageDetails(
      image: 'img/ayam.jpg',
      title: 'Ayam',
      details: 'Sebagai hewan ternak ayam dapat menghasilkan daging, bulu, telur dan pupuk.'),

  ImageDetails(
      image: 'img/lebah-madu-memakan-nektar-bunga.jpg',
      title: 'Lebah',
      details: 'Lebah bisa menghasilkan madu, lilin, dan membantu dalam penyerbukan'),
  ImageDetails(
      image: 'img/domba-bahasa-inggris.jpg',
      title: 'Domba',
      details: 'Domba bisa menghasilkan wol,daging, susu, dan kulit'),
  ImageDetails(
      image: 'img/kurban-kerbau-bolehkah.jpg',
      title: 'Kerbau',
      details: 'Kerbau bisa menghasilkan Tenaga, daging, susu dan tanduk'),
  ImageDetails(
      image: 'img/macam-warna-ayam-kalkun.jpg',
      title: 'Ayam Kalkun',
      details: 'Ayam kalkun bisa menghasilkan bulu dan daging. Merupakan sistem alarm yang cukup murah, disaat mereka mulai mengenali lingkungannya, burung ini cenderung sangat gugup, khususnya pada malam hari, jika mendengar sesuatu mereka banyak mengeluarkan suara gaduh yang berisik. Jadi sang pemilik rumah atau tetangga rumah dapat mengetahui ada sesuatu yang salah.'),
  ImageDetails(
      image: 'img/sebutkan-contoh-jenis-hewan-yang-hidup-di-padang-pasir.jpeg',
      title: 'Unta',
      details: 'Unta bisa menghasilkan daging, susu, transportasi, dan kulit'),

];
class Galery extends StatelessWidget {
//  final GlobalKey<ScaffoldState> _scaffoldkey=new GlobalKey<ScaffoldState>();

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
      backgroundColor: Colors.lightBlueAccent,
      body:
    //  SafeArea(
    //    child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 40,),
            Text('Galery', style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),


            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical:30,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),),
                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ), itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Details(
                              image: _images[index].image,
                              title: _images[index].title,
                              details: _images[index].details,
                              index: index,
                            )
                        )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(_images[index].image),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),);
                  }, itemCount: _images.length,)
              ),
            ),

          ],
        ),
     );
   // );
  }
}
class ImageDetails {
  final String image;
  final String title;
  final String details;

  ImageDetails(
      {@required this.image,
        @required this.title,
        @required this.details,
      });
}
class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File _image;
  final picker = ImagePicker();
  TextEditingController nameController = TextEditingController();


  Future choiceImage()async{
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  Future uploadImage()async{
    final uri = Uri.parse("http://192.168.1.101/image_upload_php_mysql/upload.php");
    var request = http.MultipartRequest('POST',uri);
    request.fields['name'] = nameController.text;
    var pic = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image Uploded');
    }else{
      print('Image Not Uploded');
    }
    setState(() {

    });
  }

  String _mySelection;
  List<Map> _myJson = [{"id":0,"name":"<New>"},{"id":1,"name":"Test Practice"}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.camera),
            onPressed: () {
              choiceImage();
            },
          ),
          Container(
            child: _image == null ? Text('No Image Selected') : Image.file(_image),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text('Upload Image'),
            onPressed: () {
              uploadImage();
              Navigator.push(context, MaterialPageRoute(builder: (context) => Galery(),),);
            },
          ),

          Center(
            child: new DropdownButton(
              isDense: true,
              hint: new Text("Select"),
              value: _mySelection,
              onChanged: ( newValue) {

                setState(() {
                  _mySelection = newValue;
                });

                print (_mySelection);
              },
              items: _myJson.map((Map map) {
                return new DropdownMenuItem(
                  value: map["id"].toString(),
                  child: new Text(
                    map["name"],
                  ),
                );
              }).toList(),
            ),
          ),
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

);
  }
}
