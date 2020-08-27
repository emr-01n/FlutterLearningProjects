import 'package:flutter/material.dart';

class MyBodyCard extends StatelessWidget {
  //Liste veri oluşturma
  final List<int> cardNumaralari = List.generate(100, (index) => index);
  final List<String> cardAltBaslik =
      List.generate(100, (index) => "Alt başlık $index");

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: cardNumaralari
          .map(
            (eleman) => Column(
              children: <Widget>[
                Container(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.lime.shade100,
                    elevation: 10,
                    child: ListTile(
                      leading: Icon(Icons.perm_identity),
                      title: Text("Emre Akcin $eleman"),
                      subtitle: Text("${eleman*2}"),
                      onTap: () => debugPrint("$eleman"),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 8,
                  endIndent: 8,
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
/* */
