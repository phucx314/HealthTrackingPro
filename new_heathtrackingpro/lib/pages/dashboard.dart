// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_heathtrackingpro/colors/color_set.dart';
import 'package:new_heathtrackingpro/components/appbar.dart';
import 'package:new_heathtrackingpro/components/tip_ball.dart';
import 'package:new_heathtrackingpro/models/tip_ball.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: htaPrimaryColors.shade100,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // cái app bar tự làm
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: MyAppBar(username: 'Ai đấy ai mà biết'),
                ),
            
                // story hay tip j đấy (horiz scrollable)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        TipBall(tip: Tip(
                          imageUrl: 'https://picsum.photos/250?image=9', 
                          emoji: '😏', 
                          time: DateTime(2000), 
                          username: 'Đoán xem'),
                        ),
                        SizedBox(width: 15,),
                        TipBall(tip: Tip(
                          imageUrl: 'https://picsum.photos/250?image=9', 
                          emoji: '😏', 
                          time: DateTime(2000), 
                          username: 'Đoán xem'),
                        ),
                        SizedBox(width: 15,),
                        TipBall(tip: Tip(
                          imageUrl: 'https://picsum.photos/250?image=9', 
                          emoji: '😏', 
                          time: DateTime(2000), 
                          username: 'Đoán xem'),
                        ),
                        SizedBox(width: 15,),
                        TipBall(tip: Tip(
                          imageUrl: 'https://picsum.photos/250?image=9', 
                          emoji: '😏', 
                          time: DateTime(2000), 
                          username: 'Đoán xem'),
                        ),
                        SizedBox(width: 15,),
                        TipBall(tip: Tip(
                          imageUrl: 'https://picsum.photos/250?image=9', 
                          emoji: '😏', 
                          time: DateTime(2000), 
                          username: 'Đoán xem'),
                        ),
                        SizedBox(width: 15,),
                        TipBall(tip: Tip(
                          imageUrl: 'https://picsum.photos/250?image=9', 
                          emoji: '😏', 
                          time: DateTime(2000), 
                          username: 'Đoán xem'),
                        ),
                        SizedBox(width: 15,),
                        TipBall(tip: Tip(
                          imageUrl: 'https://picsum.photos/250?image=9', 
                          emoji: '😏', 
                          time: DateTime(2000), 
                          username: 'Đoán xem'),
                        ),
                      ],
                    ),
                  ),
                ),
            
                // title Your stats today và channge date (?)
            
                // mấy cái chart (khó làm quá để sau)
            
                // how much water j j đấy
            
                // cái box để hiển thị mấy cái ly nước
            
                // features
            
                // row gồm mấy cái features khác  
              ],
            ),
          )
        )
      )
    );
  }
  
}