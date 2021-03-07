
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task4new/Galery.dart';
import 'package:task4new/Kamus.dart';
import 'package:task4new/main.dart';
import 'package:task4new/view_berita/ListView.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:task4new/view_berita/ListWidget.dart';
import 'package:task4new/view_berita/detailBerita.dart';




void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
 //final GlobalKey<ScaffoldState> _scaffoldkey=new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageBerita(),
    );
  }
}
class HomePageBerita extends StatefulWidget {
  @override
  _HomePageBeritaState createState() => _HomePageBeritaState();
}

class _HomePageBeritaState extends State<HomePageBerita>
with SingleTickerProviderStateMixin{


List<ListItem> listTiles = [
  ListItem(
      "https://images.unsplash.com/photo-1567007045288-75c913dcf2ab?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1051&q=80",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
    "2 Jan 2020",
  ),
  ListItem(
    "https://images.unsplash.com/photo-1579243296996-11b715a80338?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    lipsum.createWord(numWords: 6),
    lipsum.createWord(numWords: 2),
    "3 Maret 2020",
  ),
  ListItem(
    "https://images.unsplash.com/flagged/photo-1579243296887-d3785a804265?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    lipsum.createWord(numWords: 6),
    lipsum.createWord(numWords: 2),
    "22 Maret 2020",
  ),
  ListItem(
    "https://images.unsplash.com/photo-1564656240842-c7b5e4c2b3f5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    lipsum.createWord(numWords: 6),
    lipsum.createWord(numWords: 2),
    "2 April 2020",
  ),
  ListItem(
    "https://images.unsplash.com/photo-1594302954323-7846bf62b5a6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80",
    lipsum.createWord(numWords: 6),
    lipsum.createWord(numWords: 2),
    "8 April 2020",
  ),
  ListItem(
    "https://images.unsplash.com/photo-1504867980221-c62ae681b301?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80",
    lipsum.createWord(numWords: 6),
    lipsum.createWord(numWords: 2),
    "19 April 2020",
  ),
  ListItem(
    "https://images.unsplash.com/photo-1527153857715-3908f2bae5e8?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=721&q=80",
    lipsum.createWord(numWords: 6),
    lipsum.createWord(numWords: 2),
    "25 April 2020",
  ),
  ListItem(
    "https://images.unsplash.com/photo-1511856942035-6c6146d14b90?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
    lipsum.createWord(numWords: 6),
    lipsum.createWord(numWords: 2),
    "27 April 2020",
  ),

];
List<Tab> tabList=[
  Tab(child: Text ("Top"),),
  Tab(child: Text ("Popular"),),
  Tab(child: Text ("Trending"),),
  Tab(child: Text ("Editor Choice"),),
  Tab(child: Text ("Category"),),
];
TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController (vsync: this, length: tabList.length);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        toolbarHeight: 80,
     /*   leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          )
        ),

      */
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "News",
              style: TextStyle(
            color: Colors.white,
        ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            controller: tabController,
            tabs: tabList,
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Padding(
              padding: EdgeInsets.all(8.0),
          child: Container(
            child: ListView.builder(
              itemCount: listTiles.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBerita

                    (item: listTiles[index],
                   tag: listTiles[index].newsTitle)));
                  },
                  child: listWidget(listTiles[index]),
                );
              },

            ),
          ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
          child: Container(),),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),),
        ],
      ))
    );
  }
}
