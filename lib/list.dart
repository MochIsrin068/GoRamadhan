import 'package:flutter/material.dart';
import './detail.dart';

class ListQuran extends StatefulWidget {
  List list;

  ListQuran({this.list});

  @override
  _ListQuranState createState() => _ListQuranState();
}

class _ListQuranState extends State<ListQuran> {
  Icon ico = Icon(Icons.favorite_border, color: Colors.pink);
  Icon ico2 = Icon(Icons.favorite_border, color: Colors.pink);
  Icon ico3 = Icon(Icons.favorite, color: Colors.pink);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: IconButton(
            icon: ico,
            onPressed: () {
              setState(() {
                if (ico == ico2) {
                  ico = ico3;
                } else {
                  ico = ico2;
                }
              });
            },
          ),
          title: Text(widget.list[index]['nama'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          leading: Text("${index + 1}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Detail(
                  nama: widget.list[index]['nama'],
                  asma: widget.list[index]['asma'],
                  arti: widget.list[index]['arti'],
                  keterangan: widget.list[index]['keterangan'],
                  audio: widget.list[index]['audio']),
            ));
          },
          subtitle: Text(widget.list[index]['asma']),
        );
      },
    );
  }
}
