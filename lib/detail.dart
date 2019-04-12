import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Detail extends StatefulWidget {
  String nama;
  String asma;
  String arti;
  String keterangan;
  String audio;

  Detail({this.nama, this.asma, this.arti, this.keterangan, this.audio});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  AudioPlayer audioPlayer = AudioPlayer();

  Icon icon = Icon(
    Icons.play_arrow,
    size: 35.0,
  );

  play() async {
    int result = await audioPlayer.play(widget.audio);
    if (result == 1) {
      print("play");
    }
    return result;
  }

  Icon icon2 = Icon(Icons.pause, size: 35.0);

  pause() async {
    print("Pause Clicked");
    int result = await audioPlayer.pause();
    if (result == 1) {
      print("Pause");
    }
    return result;
  }

  stop() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      print("Stoped");
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0.5,
          title: Text(widget.nama),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              stop();
              Navigator.of(context).pop();
            },
          )),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        alignment: Alignment.topCenter,
        color: Colors.amber,
        child: Card(
          elevation: 20.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: 500.0,
            height: 600.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://ak7.picdn.net/shutterstock/videos/23010907/thumb/1.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                Text(widget.nama,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                Text(widget.asma,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                Divider(),
                Text("Arti : ${widget.arti}",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 10.0),
                Center(child: Text(widget.keterangan)),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.cyanAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.skip_previous),
                iconSize: 25.0,
                onPressed: () {}),
            FloatingActionButton(
              backgroundColor: Colors.amber,
              child: icon,
              onPressed: () {
                if (icon == icon2) {
                  setState(() {
                    icon = Icon(Icons.play_arrow);
                  });
                  pause();
                } else {
                  setState(() {
                    icon = icon2;
                  });
                  play();
                }
              },
            ),
            IconButton(
                icon: Icon(Icons.skip_next), iconSize: 25.0, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
