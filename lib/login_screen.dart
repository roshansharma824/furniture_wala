import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:furniture_wala/constants/text_strings.dart';
import 'package:furniture_wala/data_class/send_otp.dart';
import 'package:furniture_wala/otp_screen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _controller;
  var _phone = "";
  final _phoneRegex = RegExp(
      "^(\\+\\d{1,2}\\s?)?1?\\-?\\.?\\s?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}\$");
  var _isValid = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  Future<SendOtp> sendOtp() async {
    var url = Uri.parse('${baseUrl}SendOtp');

    print(_phone);

    final response = await http.post(url, body: {"phone": _phone});

    if (response.statusCode == 201) {
      // If the server did return a 201 OK response,
      // then parse the JSON.
      SendOtp sendOtp = SendOtp.fromJson(json.decode(response.body));
      print(sendOtp.toJson());
      return sendOtp;
    } else {
      // If the server did not return a 201 OK response,
      // then throw an exception.
      throw Exception('Failed to send otp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Align(
                  alignment: Alignment.topRight,
                  child: Text('Skip'),
                ),
                const Icon(
                  Icons.person,
                  size: 155,
                ),
                const Text(
                  'Login to Your Account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.black12.withOpacity(0.1),
                      ),
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        onChanged: (String newText) => {
                          _isValid = _phoneRegex.hasMatch(_controller.text),
                          _phone = _controller.text,
                          setState(() {}),
                        },
                        controller: _controller,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.black),
                                gapPadding: 0.0),
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'Phone',
                            hintStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal)),
                      ),
                    )),
                ElevatedButton(
                    onPressed: () async {
                      await sendOtp();

                      if (mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtpScreen(
                                    phone: _phone,
                                  )),
                        );
                      }
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Size(
                              MediaQuery.of(context).size.width * 0.85, 55);
                        }
                        return Size(
                            MediaQuery.of(context).size.width * 0.8, 50);
                      }),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return _isValid
                              ? Colors.greenAccent
                              : Colors.redAccent;
                        }
                        return _isValid ? Colors.black : Colors.black26;
                      }),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          )
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
