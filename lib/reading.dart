import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UVReadingScreen extends StatefulWidget {
  const UVReadingScreen({super.key});

  @override
  UVReadingScreenState createState() => UVReadingScreenState();
}

class UVReadingScreenState extends State<UVReadingScreen> {
  int? _uvIndex;
  Timer? _timer;

  Future<int> getUVData() async {
    return Random().nextInt(12);
  }

  Future<void> fetchData() async {
    final uv = await getUVData();
    setState(() {
      _uvIndex = uv;
    });
  }

  void _logout() {
    context.go('/login');
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      fetchData();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final basePadding = screenWidth * 0.05;
    final titleFontSize = screenWidth * 0.045;
    final uvIndexFontSize = screenWidth * 0.15;
    final scaleFontSize = screenWidth * 0.03;
    final safetyMessageFontSize = screenWidth * 0.025;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.black),
          onPressed: () {
            context.go('/');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: _logout,
            tooltip: 'Logout',
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(basePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: basePadding, vertical: basePadding * 0.5),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700),
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                ),
                child: Text(
                  'UV Real-time Reading',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: basePadding * 2),
              Container(
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(5, 5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _uvIndex?.toString() ?? '0',
                    style: TextStyle(
                      fontSize: uvIndexFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: basePadding * 2),
              Container(
                padding: EdgeInsets.all(basePadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  border: Border.all(color: const Color(0xFFFFD700), width: 2),
                ),
                child: Column(
                  children: [
                    Text(
                      'UV Index',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: basePadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.wb_sunny,
                                color: Colors.yellow,
                                size: screenWidth * 0.06,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: basePadding * 0.5),
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    '1 - 2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: scaleFontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.wb_sunny,
                                color: Colors.yellow,
                                size: screenWidth * 0.06,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: basePadding * 0.5),
                                color: Colors.yellow,
                                child: Center(
                                  child: Text(
                                    '3 - 5',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: scaleFontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.wb_sunny,
                                color: Colors.orange,
                                size: screenWidth * 0.06,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: basePadding * 0.5),
                                color: Colors.orange,
                                child: Center(
                                  child: Text(
                                    '6 - 7',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: scaleFontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.wb_sunny,
                                color: Colors.red,
                                size: screenWidth * 0.06,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: basePadding * 0.5),
                                color: Colors.red,
                                child: Center(
                                  child: Text(
                                    '8 - 10',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: scaleFontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.wb_sunny,
                                color: Colors.purple,
                                size: screenWidth * 0.06,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: basePadding * 0.5),
                                color: Colors.purple,
                                child: Center(
                                  child: Text(
                                    '11+',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: scaleFontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: basePadding * 0.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Low\nNo protection',
                            style: TextStyle(fontSize: safetyMessageFontSize),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Moderate\nSome protection',
                            style: TextStyle(fontSize: safetyMessageFontSize),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'High\nProtection essential',
                            style: TextStyle(fontSize: safetyMessageFontSize),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Very High\nExtra protection is needed',
                            style: TextStyle(fontSize: safetyMessageFontSize),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Extreme\nStay inside',
                            style: TextStyle(fontSize: safetyMessageFontSize),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}