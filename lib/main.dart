import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import './list.dart';
import './asmaulHusna.dart';
import './home.dart';

void main() {
  runApp(MaterialApp(
    title: "Al - Quran App",
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final url = "https://al-quran-8d642.firebaseio.com/data.json?print=pretty";

  Future<List> surah() async {
    var res = await http.get(url);
    var json = jsonDecode(res.body);

    return json;
  }

  AudioPlayer audioPlayer = AudioPlayer();

  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.5,
        title: Text("Menuju Ramadhan"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(shrinkWrap: true, children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("Isrin068@gmail.com"),
            accountName: Text("Muhammad Isrin"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://ak7.picdn.net/shutterstock/videos/23010907/thumb/1.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Menu 1"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Menu 1"),
            onTap: () {},
          )
        ]),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Beranda(),
          FutureBuilder(
            future: surah(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListQuran(list: snapshot.data);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          AsmaulHusna(),
        ],
      ),
      bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            controller: controller,
            labelColor: Colors.amber,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                  icon: Icon(
                Icons.home,
              )),
              Tab(
                  icon: Icon(
                Icons.headset,
              )),
              Tab(
                  icon: Icon(
                Icons.library_books,
              )),
            ],
          )),
    );
  }
}
