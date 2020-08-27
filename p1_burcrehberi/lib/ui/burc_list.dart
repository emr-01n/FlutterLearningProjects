import 'package:flutter/material.dart';
import 'package:p1_burcrehberi/icerik.dart';

import '../burc.dart';

class BurcList extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = listeOlustur();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Burçlar"),
        ),
      ),
      body: listBody(),
    );
  }

  Widget listBody() {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 4,
        child: ListTile(
          onTap: () {
            
          },
          leading: Image.asset("src/burcIcon/" + tumBurclar[index].icon),
          title: Text(
            tumBurclar[index].ad,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          subtitle: Text(tumBurclar[index].tarih),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  List<Burc> listeOlustur() {
    List<Burc> burclar = [];
    Burc tempEleman;
    for (int i = 0; i < 12; i++) {
      String icon = "${i + 1}" + Icerik.burc_dosyaAd[i] + ".png";
      String foto = "${i + 1}" + Icerik.burc_dosyaAd[i] + ".png";

      tempEleman = Burc(Icerik.burc_ad[i], Icerik.burc_dosyaAd[i],
          Icerik.burc_tarih[i], "Emre", icon, foto);
      burclar.add(tempEleman);
    }

    return burclar;
  }
}
