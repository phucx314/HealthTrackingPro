import 'package:flutter/material.dart';
import 'package:new_heathtrackingpro/pages/dashboard.dart';
// import 'package:flutter/services.dart';
import 'package:new_heathtrackingpro/pages/signin.dart';
import 'package:new_heathtrackingpro/pages/signup.dart';

void main() {
  // //Setting SysemUIOverlay
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     systemStatusBarContrastEnforced: true,
  //     systemNavigationBarColor: Colors.transparent,
  //     systemNavigationBarDividerColor: Colors.transparent,
  //     systemNavigationBarIconBrightness: Brightness.dark,
  //     statusBarIconBrightness: Brightness.dark)
  // );
  // //Setting SystmeUIMode
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);
  runApp(Dashboard());
}