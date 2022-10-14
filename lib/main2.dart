
import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final CountDownController controller = new CountDownController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              title: Text('neon circular timer'),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // NeonCircularTimer(
                  //     onComplete: () {
                  //       controller.restart();
                  //     },
                  //     width: 200,
                  //     controller: controller,
                  //     duration: 120,
                  //     strokeWidth: 10,
                  //     isTimerTextShown: true,
                  //     neumorphicEffect: true,
                  //     outerStrokeColor: Colors.grey.shade100,
                  //     innerFillGradient: LinearGradient(colors: [
                  //       Colors.greenAccent.shade200,
                  //       Colors.blueAccent.shade400
                  //     ]),
                  //     neonGradient: LinearGradient(colors: [
                  //       Colors.greenAccent.shade200,
                  //       Colors.blueAccent.shade400
                  //     ]),
                  //     strokeCap: StrokeCap.round,
                  //     innerFillColor: Colors.black12,
                  //     backgroudColor: Colors.grey.shade100,
                  //     neonColor: Colors.blue.shade900),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              icon: Icon(Icons.play_arrow),
                              onPressed: () {
                                controller.resume();
                              }),
                          NeonCircularTimer(
                              onComplete: () {
                                controller.restart();
                              },
                              width: 80,
                              controller: controller,
                              duration: 10,
                              strokeWidth: 3,
                              textStyle: TextStyle(fontSize: 20),
                              isTimerTextShown: true,
                              neumorphicEffect: true,
                              outerStrokeColor: Colors.grey.shade100,
                              innerFillGradient: LinearGradient(colors: [
                                Colors.greenAccent.shade200,
                                Colors.blueAccent.shade400
                              ]),
                              neonGradient: LinearGradient(colors: [
                                Colors.greenAccent.shade200,
                                Colors.blueAccent.shade400
                              ]),
                              strokeCap: StrokeCap.round,
                              innerFillColor: Colors.black12,
                              backgroudColor: Colors.grey.shade100,
                              neonColor: Colors.blue.shade900),
                          IconButton(
                              icon: Icon(Icons.pause),
                              onPressed: () {
                                controller.pause();
                              }),
                          // IconButton(
                          //     icon: Icon(Icons.repeat),
                          //     onPressed: () {
                          //       controller.restart();
                          //     }),
                        ]),
                  )
                ],
              ),
            )
        ));
  }
}










// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
//
// void main() {
//   runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: const UsersList(),
//         appBar: AppBar(
//           title: const Text("Данек"),
//           centerTitle: true,
//         ),
//       )));
// }
//
// class UsersList extends StatefulWidget {
//   const UsersList({Key? key}) : super(key: key);
//
//   @override
//   UsersListState createState() => UsersListState();
// }
//
// class UsersListState extends State<UsersList> {
//   double percent =0;
//
//   static int TimeInMinut = 10;
//   int TimeInSec = TimeInMinut*60;
//   late Timer timer;
//   _StartTimer(){
//     TimeInMinut = 10;
//     int Time = TimeInMinut*60;
//     double SecPercent =(Time/100);
//     timer = Timer.periodic(Duration(seconds: 1), (timer) {
// setState(() {
//   if(Time>0) {
//     Time--;
//     if (Time % 60 == 0) {
//       TimeInMinut--;
//     }
//     if (Time % SecPercent == 0) {
//       if (percent < 1) {
//         percent += 0.01;
//       } else {
//         percent = 1;
//       }
//     }
//   }else{
//     percent =0;
//     TimeInMinut =10;
//     timer.cancel();
//   }
// });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//   return SafeArea(
//     child: Scaffold(
// body: Container(
//   decoration: BoxDecoration(
//     gradient: LinearGradient(
//       colors: [Color(0xff1542bf), Color(0xff51a8ff)],
//     begin: FractionalOffset(0.5,1),
//     ),
//   ),
//   width: double.infinity,
//   child: Expanded(
//     child: Column(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      crossAxisAlignment: CrossAxisAlignment.center,
//     children: <Widget>[
//       Padding(
//           padding: EdgeInsets.only(top: 25.0),
//         child: Text(
//           "Clock",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 40.0,
//           ),
//         ),
//       ),
//
//           CircularPercentIndicator(
//             circularStrokeCap: CircularStrokeCap.round,
//             percent: percent,
//             animation: true,
//             animateFromLastPercent: true,
//             radius: 100.0,
//             lineWidth: 15.0,
//             progressColor: Colors.white,
//             center: Text(
//               "$TimeInMinut",
//               style:  TextStyle(
//                 color: Colors.white,
//                 fontSize: 50.0,
//               ),
//             ),
//           ),
//
//
//       SizedBox(height: 10.0),
//       Padding(
//               padding: EdgeInsets.symmetric(vertical: 28.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   _StartTimer();
//                 },
//                     child: Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: Text(
//                         "Start",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     ),
//               ),
//
//             ),
//
//
//       // Padding(
//       //     padding: EdgeInsets.symmetric(vertical: 28.0),
//       //   child: ElevatedButton(
//       //
//       //     onPressed: () {  },
//       //     child: Padding(
//       //       padding: EdgeInsets.all(20.0),
//       //       child: Text(
//       //         "Start",
//       //         style: TextStyle(
//       //           color: Colors.white,
//       //           fontSize: 20.0,
//       //         ),
//       //       ),
//       //     ),
//       //
//       //   ),
//       // ),
//     ],
//     ),
//   ),
// ),
//     ),
//   );
//   }
//
//
// }