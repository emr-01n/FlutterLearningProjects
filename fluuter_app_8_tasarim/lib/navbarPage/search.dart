import 'package:flutter/material.dart';

class Search extends StatefulWidget {

  Search(Key k) : super(key: k);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            shape: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            elevation: 10,
            margin: EdgeInsets.all(10),
            child: ExpansionTile(
              key: PageStorageKey("$index"),
              title: Text("Başlık $index"),
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.blue : Colors.amber,
                    border: Border.all(width: 0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
