import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int twentyMin = 10;

  int settingTime = twentyMin;
  int runningTime = twentyMin;
  int round = 0;
  int goal = 0;
  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (runningTime == 0) {
      runningTime = settingTime;
      round = round + 1;
      isRunning = false;
      timer.cancel();
    } else {
      runningTime = runningTime - 1;
    }
    setState(() {});
  }

  void onStartPressed() {
    isRunning = true;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  void onPausePressed() {
    isRunning = false;
    timer.cancel();
    setState(() {});
  }

  void onRefreshPressed() {
    runningTime = settingTime;
    round = 0;
    isRunning = false;
    timer.cancel();
    setState(() {});
  }

  String timeFormat(int runningTime) {
    var fullTime = Duration(seconds: runningTime).toString().split('.').first;
    List<String> timeList = fullTime.split(':');
    return '${timeList[1]}:${timeList[2]}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: Container(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    icon: const Icon(Icons.list_alt),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Text(
                      'MORE',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    timeFormat(runningTime),
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 100,
                        color: Colors.white,
                        onPressed: isRunning ? onPausePressed : onStartPressed,
                        icon: isRunning
                            ? const Icon(Icons.pause_circle_outline)
                            : const Icon(
                                Icons.play_circle_outline,
                              ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        iconSize: 60,
                        color: Colors.white,
                        onPressed: onRefreshPressed,
                        icon: const Icon(
                          Icons.replay,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 255, 238, 202),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ROUND',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Text(
                            '$round',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.black,
                          ),
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'GOAL',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                print('${index + 1}');
                                return Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                );
                              },
                              itemCount: 5,
                              // children: [],
                              // child: Text(
                              //   '$goal',
                              //   style: TextStyle(
                              //     fontSize: 25,
                              //     fontWeight: FontWeight.w500,
                              //     color: Colors.black.withOpacity(0.7),
                              //   ),
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
