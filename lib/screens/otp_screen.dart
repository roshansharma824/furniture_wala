import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:furniture_wala/data_class/verify_otp_response.dart';
import 'package:http/http.dart' as http;

import '../constants/text_strings.dart';
import '../main.dart';

class OtpScreen extends StatefulWidget {
  final String phone;

  const OtpScreen({required this.phone, Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late TextEditingController _controller;
  var _otp = "";

  var _isValid = false;
  var _isLoading = false;

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

  Future<VerifyOtpResponse> verifyOtp() async {
    var url = Uri.parse('${baseUrl}VerifyOtp');

    print(_otp);

    final response =
        await http.post(url, body: {"phone": widget.phone, "otp": _otp});

    if (response.statusCode == 201) {
      // If the server did return a 201 OK response,
      // then parse the JSON.
      VerifyOtpResponse verifyOtpResponse =
          VerifyOtpResponse.fromJson(json.decode(response.body));
      print(verifyOtpResponse.toJson());
      return verifyOtpResponse;
    } else {
      // If the server did not return a 201 OK response,
      // then throw an exception.
      throw Exception('Failed to verify otp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'OTP Verification',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(
          children: [
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const Text(
                        '$tPhoneNumber +91 95-9954-0935',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 20, 0, 20),
                          child: OtpTextField(
                            autoFocus: true,
                            filled: true,
                            fieldWidth: 65,
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderColor: Colors.black,
                            showFieldAsBox: true,
                            borderWidth: 1,
                            cursorColor: Colors.black,
                            disabledBorderColor: Colors.black,
                            fillColor: Colors.black.withOpacity(0.1),
                            focusedBorderColor: Colors.black,
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                              if (code.isEmpty) {
                                setState(() {
                                  _isValid = false;
                                });
                              }
                            },
                            onSubmit: (String verificationCode) async {
                              // await verifyOtp();
                              _otp = verificationCode;
                              if (verificationCode.length == 4) {
                                _isValid = true;
                              } else {
                                _isValid = false;
                              }
                            },
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        '$tResendCode 53 s',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
                // This trailing comma makes auto-formatting nicer for build methods.
                ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_isValid) {
                        setState(() {
                          _isLoading = true;
                        });
                        await verifyOtp();

                        if (mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp()),
                          );
                        }
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
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Verify',
                            style: TextStyle(color: Colors.white),
                          )),
              ),
            ),
          ],
        ));
  }
}
