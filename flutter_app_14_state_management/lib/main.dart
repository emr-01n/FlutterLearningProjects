import 'package:flutter/material.dart';
import 'package:flutter_app_14_state_management/bloc_pack_sayac.dart';
import 'package:flutter_app_14_state_management/firebase_provider.dart';
import 'package:flutter_app_14_state_management/provider_kullanim.dart';
import 'package:flutter_app_14_state_management/sayac.dart';
import 'package:flutter_app_14_state_management/stream_counter.dart';
import 'package:flutter_app_14_state_management/user_repo.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bloc_kullanimi.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Sayac(0),),
        ChangeNotifierProvider(create: (context)=>UserReposity()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProviderSayac()));
                },
                child: Text("Provider Kullanımı"),
              ),
               RaisedButton(
                 color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProviderWithFirebase()));
                },
                child: Text("Provider FirebaseAuth"),
              ),
              RaisedButton(
                 color: Colors.green,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => StreamCounter()));
                },
                child: Text("Stream Counter"),
              ),
              RaisedButton(
                 color: Colors.teal,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BlocKullanimi()));
                },
                child: Text("Bloc Kullanımı"),
              ),
              RaisedButton(
                 color: Colors.indigo,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BlocPackSayac()));
                },
                child: Text("Bloc Pack Kullanımı"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
