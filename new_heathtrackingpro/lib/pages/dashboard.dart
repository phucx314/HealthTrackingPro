// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_heathtrackingpro/colors/color_set.dart';
import 'package:new_heathtrackingpro/components/appbar.dart';
import 'package:new_heathtrackingpro/components/feature.dart';
import 'package:new_heathtrackingpro/components/tip_ball.dart';
import 'package:new_heathtrackingpro/components/water_intake.dart';
import 'package:new_heathtrackingpro/models/tip_ball.dart';
import 'package:new_heathtrackingpro/styles/box_shadow.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: htaPrimaryColors.shade100,
        body: SafeArea(
          child: Column(
            children: [
              // Phần không cuộn
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 25, right: 15, left: 15),
                child: MyAppBar(username: 'Alice'),
              ),
              // Cuộn cả Column này
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // story hay tip j đấy (horiz scrollable)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              TipBall(
                                tip: Tip(
                                  imageUrl:
                                      'https://picsum.photos/250?image=9',
                                  emoji: '😏',
                                  time: DateTime(2000),
                                  username: 'Đoán xem',
                                ),
                              ),
                              SizedBox(width: 15,),
                              TipBall(
                                tip: Tip(
                                  imageUrl:
                                      'https://picsum.photos/250?image=9',
                                  emoji: '😏',
                                  time: DateTime(2000),
                                  username: 'Đoán xem',
                                ),
                              ),
                              SizedBox(width: 15,),
                              TipBall(
                                tip: Tip(
                                  imageUrl:
                                      'https://picsum.photos/250?image=9',
                                  emoji: '😏',
                                  time: DateTime(2000),
                                  username: 'Đoán xem',
                                ),
                              ),
                              SizedBox(width: 15,),
                              TipBall(
                                tip: Tip(
                                  imageUrl:
                                      'https://picsum.photos/250?image=9',
                                  emoji: '😏',
                                  time: DateTime(2000),
                                  username: 'Đoán xem',
                                ),
                              ),
                              SizedBox(width: 15,),
                              TipBall(
                                tip: Tip(
                                  imageUrl:
                                      'https://picsum.photos/250?image=9',
                                  emoji: '😏',
                                  time: DateTime(2000),
                                  username: 'Đoán xem',
                                ),
                              ),
                              SizedBox(width: 15,),
                              TipBall(
                                tip: Tip(
                                  imageUrl:
                                      'https://picsum.photos/250?image=9',
                                  emoji: '😏',
                                  time: DateTime(2000),
                                  username: 'Đoán xem',
                                ),
                              ),
                              SizedBox(width: 15,),
                              TipBall(
                                tip: Tip(
                                  imageUrl:
                                      'https://picsum.photos/250?image=9',
                                  emoji: '😏',
                                  time: DateTime(2000),
                                  username: 'Đoán xem',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      // title Your stats today và channge date (?)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'Your stats for today',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      // mấy cái chart (khó làm quá để sau)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: htaPrimaryColors.shade50,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [shadow],
                          ),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Calories
                              Text(
                                'Calories',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 15,),
                              // pie charts
                              Container(
                                height: 110, // Đã sửa lại từ 1110
                                child: Row(
                                  children: [
                                    // chỗ này là số kcal đã hấp thụ
                                    // chỗ này là cái pie chart remaining kcal
                                    // chỗ này là số kcal đã đốt
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),
                              // sleep
                              Text(
                                'Sleep',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 15,),
                              // chỗ này là cái sleep stats bar chart
                              Container(
                                height: 120, // Đã sửa lại từ 120
                              )
                              // nút xem chi tiết
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),

                      // how much water j j đấy
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'How much have you drunk today?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),

                      // cái box để hiển thị mấy cái ly nước
                      WaterIntake(), // sửa lại theo logic sau
                      SizedBox(height: 25,),

                      // features
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'More features',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),

                      // row gồm mấy cái features khác
                      SingleChildScrollView(
                        clipBehavior: Clip.none, // cái này fix lỗi mấy cái shadows bị clipped mất
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Feature(),
                              SizedBox(width: 15,),
                              Feature(),
                              SizedBox(width: 15,),
                              Feature(),
                              SizedBox(width: 15,),
                              Feature(),
                              SizedBox(width: 15,),
                              Feature(),
                            ],
                          ),
                        ),
                      ),

                      // padding dưới
                      SizedBox(height: 25,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
