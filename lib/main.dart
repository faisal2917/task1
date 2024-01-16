import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task/screens/post_data_screen.dart';
import 'package:get/get.dart';
import 'package:task/screens/testing-screen.dart';
import 'package:task/uitask/username.dart';
import 'package:web_socket_channel/io.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        // builder: (context, Widget) {
        //   // ScreenUtil.setContext(context);
        //   return MediaQuery(
        //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        //     child: DataScreen(),
        //   );
        // },
        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        home: SendMeassge(
          channel: IOWebSocketChannel.connect("wss://echo.websocket.events"),
        ),
        // AddInformation(),
      ),
    );
  }
}
