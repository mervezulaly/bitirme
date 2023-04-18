import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_proje/firebase_options.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bitirme_proje/pages/register.dart';

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
      title: "Mesajlaşma Uygulaması",
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  get userName => null;

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: Text("Login")),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         TextField(),
    //         TextField(),
    //         ElevatedButton(
    //             onPressed: () {
    //               Navigator.push(context,
    //                   MaterialPageRoute(builder: ((context) => Temel())));
    //             },
    //             child: Text("Login"))
    //       ],
    //     ),

    //   ),
    // );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 180, 101),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text("Giriş Yap"),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Spacer(),
                      FaIcon(FontAwesomeIcons.google, color: Colors.black),
                      SizedBox(width: 5),
                      Text(
                        "Google ile giriş yap",
                        style: TextStyle(color: Colors.black),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70, top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Spacer(),
                      FaIcon(
                        FontAwesomeIcons.apple,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Apple ile giriş yap",
                        style: TextStyle(color: Colors.black),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    indent: 70,
                    thickness: 3,
                    color: Colors.white,
                    height: 20,
                  )),
                  SizedBox(width: 10),
                  Text(
                    "veya",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      endIndent: 70,
                      height: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70, top: 10),
                child: TextField(
                  controller: userName,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText:
                          "Telefon numarası, E-posta veya kullanıcı adı"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      if (userName.text == User) {
                        print("Giriş Başarılı");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Temel()));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Temel())));
                          },
                          child: Text(
                            "İleri",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Şifreni mi unuttun?"),
                      ],
                    )),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "Henüz bir hesabın yok mu?",
                    style: TextStyle(color: Colors.black),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Register())));
                      },
                      child: Text("Kaydol"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Temel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 180, 101),
      appBar: AppBar(
        title: Text("Mesajlaşma Uygulaması"),
        backgroundColor: Colors.orange,
      ),
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
          backgroundColor: Colors.greenAccent,
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
