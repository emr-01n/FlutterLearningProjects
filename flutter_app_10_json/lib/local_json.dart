import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'package:flutter_app_10_json/model/araba.dart';

class LocalJson extends StatefulWidget {
  @override
  _LocalJsonState createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  List<Araba> arabalar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // veriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local JSON"),
      ),
      body: FutureBuilder(
          future: veriOkuV2(),
          builder: (context, veri) {
            if (veri.hasData) {
              return ListView.builder(
                itemCount: arabalar.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(arabalar[index].marka),
                      subtitle:
                          Text(arabalar[index].model[0].model.toString()),
                    ),
                  );
                },
              );
            } else {
              return Container();
            }
          }),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Local JSON"),
        ),
        body: arabalar == null
            ? Container()
            : ListView.builder(
                itemCount: arabalar.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(arabalar[index]["marka"]),
                      subtitle:
                          Text(arabalar[index]["model"][0]["model"].toString()),
                    ),
                  );
                }));
  }
  */

  /*
  veriOku() async {
    var cevap = await DefaultAssetBundle.of(context)
        .loadString("assets/data/arabalar.json");
    /*setState(() {
      donecekVeri = cevap;
    });*/
    setState(() {
      arabalar = json.decode(cevap);
    });
  }*/

  veriOkuV2() async {
    var cevap = await DefaultAssetBundle.of(context)
        .loadString("assets/data/arabalar.json");
    arabalar = (json.decode(cevap) as List).map((e) => Araba.fromJsonMap(e)).toList();
    return cevap;
  }
}
