import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class VerifyPage extends StatelessWidget {

  late final String? _num;

  VerifyPage(String num, {Key? key}) : super(key: key) {
    _num = num;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Reg")),
        body: VerifyContainer(_num!),
      ),
    );
  }
}
class VerifyContainer extends StatefulWidget {

  late final String? _num;

  VerifyContainer(String num, {Key? key}) : super(key: key) {
   _num = num;
  }

  @override
  VerifyState createState() => VerifyState();

}

class VerifyState extends State<VerifyContainer> {

  late int _code;
  late String _id;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _submitPhoneNumber();
    return Padding(padding: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 16.0,left: 32.0,right: 32.0),
            child:  const TextField(
              //controller: _phoneController,
              key: Key("phone_input"),
              decoration: InputDecoration(
                  hintText: "Телефон",
                  border: InputBorder.none,
                  fillColor: Colors.black12,
                  filled: true,
                  labelText: "Телефон"

              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed:  () {

                } ,
                child: const Text("Войти",
                  style: TextStyle(fontSize: 18),

                ),
              )
          )
        ],
      ));
  }

  Future<void> _submitPhoneNumber() async {
    String phoneNumber = widget._num.toString().trim();
    print(phoneNumber);

    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      //this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(FirebaseAuthException error) {
      //exception???
      print(error);
    }

    void codeSent(String verificationId, int? code) async {
      print('codeSent');
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: "");
      await FirebaseAuth.instance.signInWithCredential(credential);
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,
      timeout: const Duration(milliseconds: 10000),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}