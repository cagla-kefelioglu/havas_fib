// ignore_for_file: unused_import, unused_field, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, deprecated_member_use, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, duplicate_import, unused_local_variable, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import 'dart:convert';
import '../constant/constant.dart';
//import 'package:http/http.dart' as http;

class TwoDialogPopat extends StatelessWidget {
  List<int>? diziTwo;
  TwoDialogPopat({this.diziTwo});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        child: _buildChild(context, height, width),
      ),
    );
  }

  _buildChild(BuildContext context, var height, var width) =>
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
              width: width * 0.9,
              decoration: _clikDecoration,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Image.asset(
                              'images/icons/close.svg',
                              width: 33,
                              color: Constant.dark,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: diziTwo!
                                          .map((index) => Text(
                                                diziTwo![index].toString(),
                                                style: TextStyle(
                                                    fontFamily: 'PoppinsBold',
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ]),
            ),
          ],
        ),
      );

  BoxDecoration _clikDecoration = BoxDecoration(
    color: Constant.darkWhite,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(width: 1.0, color: Constant.dark),
  );
  TextStyle _text = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Constant.dark);
  TextStyle _buttonText = TextStyle(
      fontSize: 21,
      fontFamily: 'PoppinsBold',
      fontWeight: FontWeight.w700,
      letterSpacing: 1.5);
}
