// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_heathtrackingpro/colors/color_set.dart';
import 'package:new_heathtrackingpro/styles/box_shadow.dart';

class MyAppBar extends StatelessWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onProfilePressed;
  final VoidCallback? onNotificationPressed;
  final String username;

  const MyAppBar({
    Key? key,
    this.onMenuPressed,
    this.onProfilePressed,
    this.onNotificationPressed,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // menu
        IconButton(
          onPressed: () {
            // Xử lý khi người dùng nhấn vào biểu tượng
          },
          icon: Image.asset('assets/icons/btn_menu.png', width: 30, height: 30,),
        ),

        // profile pic với tên
        Container(
          decoration: BoxDecoration(
            color: htaPrimaryColors.shade50,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              shadow,
            ],
          ),
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              // ava
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar1.png'),
                radius: 16,
              ),
              SizedBox(width: 15),
              // username
              Text(
                'Hi, ' + username, 
                style: TextStyle(
                  color: htaPrimaryColors.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),

        // icon cái chuông tbao
        IconButton(
          onPressed: () {
            // Xử lý khi người dùng nhấn vào biểu tượng
          },
          icon: Image.asset('assets/icons/btn_noti.png', width: 35, height: 35,),
        ),
      ],
    );
    
    
    
    
  //   return AppBar(
  //     backgroundColor: Colors.blue,
  //     elevation: 4, // Đặt độ cao của bóng
  //     leading: IconButton(
  //       icon: Icon(Icons.menu),
  //       onPressed: onMenuPressed,
  //     ),
  //     title: GestureDetector(
  //       onTap: onProfilePressed,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           CircleAvatar(
  //             backgroundImage: AssetImage('assets/images/avatar1.png'),
  //             radius: 16,
  //           ),
  //           SizedBox(width: 8),
  //           Text(username),
  //         ],
  //       ),
  //     ),
  //     actions: [
  //       IconButton(
  //         icon: Icon(Icons.notifications),
  //         onPressed: onNotificationPressed,
  //       ),
  //     ],
  //   );
  // }

  // @override
  // Size get preferredSize => Size.fromHeight(kToolbarHeight);
  }
}