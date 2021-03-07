import 'package:flutter/material.dart';

class Kamus extends StatefulWidget {
  @override
  _KamusState createState() => _KamusState();
}

class _KamusState extends State<Kamus> {
  var etSearce = new TextEditingController();

  bool isSearch = true;

  String query = "";

  List<String> dataList;
  List<String> filterList;

  @override
  void initState() {
    super.initState();

    dataList = new List<String>();

    dataList = [
      "sakit",
      "etilogi",
      "hospes",
      "infeksi",
      "infeksious",
      "infektivitas",
      "virulensi",
      "latensi",
      "patogenitas",
      "kontagius",
      "non kontagius",
      "predesposisi",
      "mordibiditas",
      "mortalitas",
      "mortalitas",
      "epizootik",
      "enzootik",
      "pandemik",
      "sporadik",
      "endemia",
      "epidemia",
      "antibodi",
      "antigen",
      "infeksi primer",
      "infeksi sekunder",
      "diagnosa",
      "diferensial Diagnosa"
    ];
    dataList.sort();
  }

  _KamusState() {
    etSearce.addListener(() {
      if (etSearce.text.isEmpty) {
        setState(() {
          isSearch = false;
          query = etSearce.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary'),
        backgroundColor: Colors.brown,
        actions: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.search, color: Colors.white,),
          ),
        ],
      ),

      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            _createSearchView(),
            isSearch ? _performSearch() : _createSearchView(),
          ],

        ),
      ),
    );
  }

  Widget _createSearchView() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1.0)
      ),
      child: TextField(
        controller: etSearce,
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.green)
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _createListView() {
    return Flexible(child: ListView.builder(itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(margin: EdgeInsets.all(10.0)),
          color: Colors.white,
          elevation: 5.0,);
      },
    ),);
  }

  Widget _performSearch() {
    filterList = new List<String>();
    for (int i = 0; i < dataList.length; i++) {
      var item = dataList[i];

      if (item.toLowerCase().contains(query.toLowerCase())) {
        filterList.add(item);
      }
    }
    return _createListView();
  }
}