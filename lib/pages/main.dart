import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_proje/firebase_options.dart';
// import 'package:flutter_bitirme_proje/pages/main.dart'

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mesajlaşma UYgulaması",
      home: Temel(),
    );
  }
}

class Temel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mesajlaşma Uygulaması")),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();

  List<MesajBaloncuk> mesajListesi = [];

  listeyeEkle(String gelenm) {
    setState(() {
      MesajBaloncuk mesajNesne = MesajBaloncuk(mesaj: gelenm);
      mesajListesi.insert(0, mesajNesne);
      t1.clear();
    });
  }

// METİN GİRİŞ ALANI WİDGET
  Widget metinGiris() {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: t1,
            ),
          ),
          IconButton(
            onPressed: () => listeyeEkle(t1.text),
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                reverse: true,
                itemCount: mesajListesi.length,
                itemBuilder: (_, indexNumber) => mesajListesi[indexNumber]),
          ),
          Divider(
            thickness: 1,
          ),
          metinGiris(),
        ],
      ),
    );
  }
}

String isim = "Kullanici1";

class MesajBaloncuk extends StatelessWidget {
  String mesaj;

  MesajBaloncuk({required this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        CircleAvatar(
          child: Text(isim[0]),
        ),
        Column(
          children: <Widget>[
            Text(isim),
            Text(mesaj),
          ],
        )
      ]),
    );
  }
}

@override
Widget build(BuildContext context) {
  throw UnimplementedError();
}
