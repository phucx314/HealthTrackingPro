// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../colors/color_set.dart';
import '../components/appbar.dart';
import '../styles/box_shadow.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: htaPrimaryColors.shade100,
        body: SafeArea(
          child: Column(
            children: [
              // app bar
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 25, top: 25, right: 25, left: 25),
                child: MyAppBar(
                  username: 'username',
                ),
              ),

              // ảnh bìa và cái ava
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 0, top: 0, right: 25, left: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: Colors.amber,
                        boxShadow: [
                          shadow,
                        ],
                      ),
                      height: 96,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: AssetImage(
                            'assets/images/cover_pic1.png',
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // ava
              Center(
                child: Positioned(
                  top: 30,
                  child: Container(
                    height: 96,
                    width: 96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.5 * 96),
                      color: Colors.amber,
                      boxShadow: [
                        shadow,
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
