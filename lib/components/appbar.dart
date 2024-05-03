// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../colors/color_set.dart';
import '../styles/box_shadow.dart';

class MyAppBar extends StatelessWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onProfilePressed;
  final VoidCallback? onNotificationPressed;
  final String username;

  const MyAppBar({
    super.key,
    this.onMenuPressed,
    this.onProfilePressed,
    this.onNotificationPressed,
    required this.username,
  });

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
          icon: Image.asset(
            'assets/icons/btn_menu.png',
            width: 30,
            height: 30,
          ),
        ),
        SizedBox(
          width: 15,
        ),

        // profile pic với tên
        Expanded(
          flex: 2,
          child: Container(
            height: 60,
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: htaPrimaryColors.shade50,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                shadow,
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ava
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar1.png'),
                      radius: 16,
                    ),
                    SizedBox(width: 15),
                    // username
                    Flexible(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Hi, $username',
                          overflow: TextOverflow
                              .ellipsis, // Hiển thị dấu '...' khi văn bản tràn ra ngoài
                          maxLines: 1, // Giới hạn số dòng là 1
                          style: TextStyle(
                            color: htaPrimaryColors.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),

        // icon cái chuông tbao
        IconButton(
          onPressed: () {
            // Xử lý khi người dùng nhấn vào biểu tượng
          },
          icon: Image.asset(
            'assets/icons/btn_noti.png',
            width: 35,
            height: 35,
          ),
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
