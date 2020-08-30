import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Elizabeth Debicki"),
              accountEmail: Text("em_re_ak_cin@hotmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/profile_images/1170563864628465666/D_9SBZNC.jpg"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.imgur.com/14iGgqB.jpg",
                      scale: 0.8),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://playtusu.com/wp-content/uploads/2014/05/7155.jpg"),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.amber,
                    child: Container(
                      //color: Colors.blue,
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          size: 30,
                        ),
                        title: Text(
                          "AnaSayfa",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.amber,
                    child: Container(
                      //color: Colors.blue,
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          size: 30,
                        ),
                        title: Text(
                          "Contact",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.amber,
                    onTap: () {},
                    child: Container(
                      //color: Colors.blue,
                      child: ListTile(
                        leading: Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        title: Text(
                          "Settings",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}