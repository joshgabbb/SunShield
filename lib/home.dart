import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int? _uvIndex;
  String _safetyMessage = '';
  Timer? _timer;

  Future<int> getUVData() async {
    return Random().nextInt(12);
  }

  Future<void> fetchData() async {
    final uv = await getUVData();
    setState(() {
      _uvIndex = uv;
      if (uv <= 2) {
        _safetyMessage = 'Low: No protection';
      } else if (uv <= 5) {
        _safetyMessage = 'Moderate: Some protection';
      } else if (uv <= 7) {
        _safetyMessage = 'High: Protection essential';
      } else if (uv <= 10) {
        _safetyMessage = 'Very High: Extra protection is needed';
      } else {
        _safetyMessage = 'Extreme: Stay inside';
      }
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
    final double titleFontSize = screenWidth * 0.045;
    final double buttonFontSize = screenWidth * 0.04;
    final double scaleFontSize = screenWidth * 0.03;
    final double safetyMessageFontSize = screenWidth * 0.025;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: basePadding, vertical: basePadding * 0.75),
              decoration: const BoxDecoration(
                color: Color(0xFFFFD700),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.black),
                    onPressed: _logout,
                    tooltip: 'Logout',
                  ),
                  Text(
                    'SunShield',
                    style: TextStyle(
                      fontSize: titleFontSize * 1.2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(width: basePadding), // Spacer for balance
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
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
                          'Arduino Uno with ML8511',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: basePadding),
                      Container(
                        padding: EdgeInsets.all(basePadding * 0.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD700),
                          borderRadius: BorderRadius.circular(screenWidth * 0.05),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: basePadding * 0.5),
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF90EE90),
                                          Color(0xFF32CD32),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                    ),
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
                                ),
                                Expanded(
                                  child: Container(
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
                                ),
                                Expanded(
                                  child: Container(
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
                                ),
                                Expanded(
                                  child: Container(
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
                                ),
                                Expanded(
                                  child: Container(
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
                                ),
                              ],
                            ),
                            SizedBox(height: basePadding * 0.5),
                            GestureDetector(
                              onTap: () {
                                context.push('/reading');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: basePadding, vertical: basePadding * 0.5),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(screenWidth * 0.025),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.wb_sunny,
                                      color: Colors.yellow,
                                      size: screenWidth * 0.06,
                                    ),
                                    SizedBox(width: basePadding * 0.5),
                                    Text(
                                      'UV Reading',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: buttonFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                      SizedBox(height: basePadding),
                      GestureDetector(
                        onTap: () {
                          context.push('/education');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenWidth * 0.05),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(screenWidth * 0.05),
                                child: Image.asset(
                                  'assets/images/uv_education_background.jpg',
                                  width: double.infinity,
                                  height: screenHeight * 0.2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: screenHeight * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: basePadding, vertical: basePadding * 0.5),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(screenWidth * 0.025),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.wb_sunny,
                                      color: Colors.yellow,
                                      size: screenWidth * 0.06,
                                    ),
                                    SizedBox(width: basePadding * 0.5),
                                    Text(
                                      'UV Education',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: buttonFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: basePadding),
                      ElevatedButton(
                        onPressed: () {
                          context.push('/about');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFD700),
                          padding: EdgeInsets.symmetric(
                              horizontal: basePadding * 2, vertical: basePadding),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.075),
                          ),
                        ),
                        child: Text(
                          'About us',
                          style: TextStyle(
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: basePadding),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}