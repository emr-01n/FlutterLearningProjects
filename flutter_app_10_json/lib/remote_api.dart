import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'model/post.dart';

class RemoteApi extends StatefulWidget {
  @override
  _RemoteApiState createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  Post gonderi;

  Future<List<Post>> _gonderiGetir() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      //print(response.body);
      //print(response.statusCode);
      //return Post.fromJson(jsonDecode(response.body));
      return (json.decode(response.body) as List).map((tekPost) =>Post.fromJson(tekPost)).toList();
    } else {
      throw Exception("Bağlanamadık ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    /*
    _gonderiGetir().then((post) {
      setState(() {
        gonderi = post;
      });
      print(gonderi.body);
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api"),
      ),
      body: FutureBuilder(
          future: _gonderiGetir(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].body),
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Container(
                        child: Text(snapshot.data[index].id.toString()),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
