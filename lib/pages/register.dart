import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userNumber = TextEditingController();
  TextEditingController userPass = TextEditingController();
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Kaydol"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: TextField(
                controller: userName,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Lütfen kullanıcı adı giriniz"),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: TextField(
                controller: userEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Lütfen email adresinizi giriniz"),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: TextField(
                controller: userNumber,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Lütfen telefon numaranızı giriniz"),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: TextField(
                controller: userPass,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Lütfen şifrenizi giriniz",
                  suffixIcon: isShow
                      ? IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isShow = !isShow;
                            });
                          },
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isShow = !isShow;
                            });
                          },
                          icon: Icon(Icons.visibility_off),
                        ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Kaydol")],
                ),
                onPressed: () async {
                  Map<String, dynamic> register = {
                    "userName": userName.text,
                    "userPass": userPass.text,
                    "userNumber": userNumber.text,
                    "userEmail": userEmail.text
                  };
                  FirebaseFirestore.instance
                      .collection("user")
                      .doc(userName.text)
                      .set(register)
                      .then((value) =>
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Kaydol"),
                          )));

                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
