import 'package:firstflutter/verify_number_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();

}
class _LoginState extends State<LoginPage> {

  var _buttonEnable = true;

  var _phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.zero,
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 16.0,left: 32.0,right: 32.0),
            child:  TextField(
              controller: _phoneController,
              key: const Key("phone_input"),
              decoration: const InputDecoration(
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
                onPressed: _buttonEnable ? () {
                  print("text");
                  print(_phoneController.text);
                  if(_phoneController.text.isEmpty) {

                    return;
                  }
                  print("next");
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>VerifyPage(_phoneController.text)));
                } : null,
                child: const Text("Войти",
                  style: TextStyle(fontSize: 18),

                ),
              )
          )
        ],
      ),
    );
  }

}