// ignore_for_file: unused_import, use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields, unused_field, depend_on_referenced_packages, missing_required_param, unused_element, avoid_print, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:helloworld/dialog.dart';
import 'dart:convert';

import 'constant/constant.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _ilk = TextEditingController();
  TextEditingController _son = TextEditingController();
  List<int> dizi = [1, 1];
  List<int> diziTwo = [];

  int i = 0;
  int n = 0;
  int sayac = 0;
  void _fibonacci(int deger1, int deger2, dynamic context) async {
    if (deger1 > deger2 && deger1 > 0 && deger2 > 0) {
      setState(() {
        n = deger2;
        for (i = 2; i < n; i++) {
          if (deger1 > i && n >= dizi[i]) {
            dizi[i] = dizi[i - 1] + dizi[i - 2];
          } else if (deger1 <= i && n >= dizi[i]) {
            sayac++;
            dizi[i] = dizi[i - 1] + dizi[i - 2];
            diziTwo[sayac] = dizi[i];
            print(diziTwo[sayac]);
          }
        }
        ;
      });
      return _openDialog(context, diziTwo);
    } else
      AlertDialog(
        title: Column(
          children: [
            Text('SON DEĞER İLK DEĞERDEN BÜYÜK OLMALI'),
            Text('DEĞERLER NEGATİF OLAMAZ'),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Constant.darkWhite,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 1,
                    width: width * 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                          child: SizedBox(
                              height: height * 0.3,
                              width: width * 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Fibonacci",
                                        style: TextStyle(
                                            fontFamily: 'Bebas',
                                            fontSize: 37,
                                            color: Constant.dark,
                                            letterSpacing: 2),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Calculator",
                                        style: TextStyle(
                                            fontFamily: 'Bebas',
                                            fontSize: 39,
                                            color: Constant.dark,
                                            letterSpacing: 2.5),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        Form(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: SizedBox(
                              height: height * 0.6,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: width * 1,
                                    height: 60,
                                    child: Container(
                                      decoration: _boxDecoration,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: _fiedlDecoration,
                                        controller: _ilk,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 1,
                                    height: 60,
                                    child: Container(
                                      decoration: _boxDecoration,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: _fiedlDecoration.copyWith(
                                          labelText: "Son Eleman",
                                        ),
                                        controller: _son,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 1,
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        _ilk.text.isNotEmpty &&
                                                _son.text.isNotEmpty
                                            ? _fibonacci(int.parse(_ilk.text),
                                                int.parse(_son.text), context)
                                            : null;
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              _ilk.text.isNotEmpty &&
                                                      _son.text.isNotEmpty
                                                  ? Constant.green
                                                  : Constant.accentDark,
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10),
                                          )),
                                      child: Text(
                                        "Diziyi Hesapla",
                                        style: TextStyle(
                                          color: Constant.darkWhite,
                                          fontFamily: 'PoppinsBold',
                                          fontSize: 30,
                                          letterSpacing: 0.7,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _fiedlDecoration = InputDecoration(
      labelText: "İlk Eleman",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 195, 23, 10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Constant.dark,
        ),
      ),
      filled: true, //backgroundu değişmek için true yapılır
      fillColor: Constant.grey, //background

      labelStyle: TextStyle(
        color: Constant.hinText,
        letterSpacing: 0.6,
        fontSize: 15,
        fontFamily: 'PoppinsBold',
      ));
  BoxDecoration _boxDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(1),
        spreadRadius: 0,
        blurRadius: 30,
        offset: Offset(-10, -10), // changes position of shadow
      ),
      BoxShadow(
        color: Constant.shadowGrey,
        spreadRadius: 0,
        blurRadius: 30,
        offset: Offset(10, 10), // changes position of shadow
      ),
    ],
  );

  Future _openDialog(dynamic context, List<int> diziTwo) => showDialog(
        barrierDismissible: false,
        barrierColor: Constant.popat,
        context: context,
        builder: ((context) => TwoDialogPopat(diziTwo: diziTwo)),
      );
}
