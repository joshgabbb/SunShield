import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UVEducationScreen extends StatelessWidget {
  const UVEducationScreen({super.key});

  void _logout(BuildContext context) {
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final basePadding = screenWidth * 0.05;
    final titleFontSize = screenWidth * 0.045;
    final contentFontSize = screenWidth * 0.038;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UV Education',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFFFD700),
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.black),
          onPressed: () {
            context.go('/');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () => _logout(context),
            tooltip: 'Logout',
          ),
        ],
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Banner
            Container(
              width: double.infinity,
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFFFFD700), const Color(0xFFFFE082)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Image.network(
                      'https://via.placeholder.com/800x300?text=UV+Education+Banner',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade200,
                        );
                      },
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        size: 60,
                        color: Colors.black87,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Learn About UV Radiation',
                        style: TextStyle(
                          fontSize: titleFontSize * 1.2,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Content Sections
            Padding(
              padding: EdgeInsets.all(basePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // What is UV?
                  ExpansionTile(
                    leading: const Icon(
                      Icons.wb_sunny,
                      color: Color(0xFFFFD700),
                      size: 30,
                    ),
                    title: Text(
                      'What is UV Radiation?',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    tilePadding: EdgeInsets.symmetric(
                        horizontal: basePadding, vertical: 5),
                    childrenPadding: EdgeInsets.all(basePadding),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    children: [
                      Text(
                        'Ultraviolet (UV) radiation is a type of electromagnetic radiation emitted by the sun and artificial sources like tanning beds. It has wavelengths shorter than visible light but longer than X-rays, ranging from 100 to 400 nanometers. UV radiation is divided into three types: UVA, UVB, and UVC, with UVA and UVB reaching the Earth’s surface.',
                        style: TextStyle(
                          fontSize: contentFontSize,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Damages Caused by UV
                  ExpansionTile(
                    leading: const Icon(
                      Icons.warning_amber_rounded,
                      color: Color(0xFFFFD700),
                      size: 30,
                    ),
                    title: Text(
                      'Damages Caused by UV Radiation',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    tilePadding: EdgeInsets.symmetric(
                        horizontal: basePadding, vertical: 5),
                    childrenPadding: EdgeInsets.all(basePadding),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    children: [
                      Text(
                        '• Skin Damage: UV radiation can cause sunburn, premature aging (wrinkles, age spots), and increase the risk of skin cancer, including melanoma.\n'
                            '• Eye Damage: Prolonged exposure can lead to cataracts, photokeratitis (sunburn of the cornea), and other eye conditions.\n'
                            '• Immune System Suppression: Excessive UV exposure can weaken the immune system, making the body more susceptible to infections.\n'
                            '• DNA Damage: UV rays can penetrate skin cells, causing DNA mutations that may lead to cancerous growths.',
                        style: TextStyle(
                          fontSize: contentFontSize,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Importance of UV
                  ExpansionTile(
                    leading: const Icon(
                      Icons.lightbulb_outline,
                      color: Color(0xFFFFD700),
                      size: 30,
                    ),
                    title: Text(
                      'Importance of UV Radiation',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    tilePadding: EdgeInsets.symmetric(
                        horizontal: basePadding, vertical: 5),
                    childrenPadding: EdgeInsets.all(basePadding),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    children: [
                      Text(
                        'UV radiation has several benefits when exposure is balanced:\n'
                            '• Vitamin D Synthesis: UV radiation helps the body produce vitamin D, which is essential for bone health, immune function, and calcium absorption.\n'
                            '• Sterilization: UV light is used to disinfect water, air, and surfaces by killing bacteria and viruses.\n'
                            '• Mood Enhancement: Sunlight exposure, which includes UV, can boost serotonin levels, improving mood and reducing symptoms of depression.\n'
                            '• Ecological Balance: UV radiation plays a role in plant growth and ecosystems, influencing photosynthesis and animal behavior.\n\n'
                            'However, it’s crucial to maintain the proper amount of UV exposure. Too much UV radiation can lead to serious problems, such as skin cancer, eye damage, and immune system suppression, as noted in the damages section.',
                        style: TextStyle(
                          fontSize: contentFontSize,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // How to Alleviate UV Damage
                  ExpansionTile(
                    leading: const Icon(
                      Icons.health_and_safety,
                      color: Color(0xFFFFD700),
                      size: 30,
                    ),
                    title: Text(
                      'How to Alleviate UV Damage',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    tilePadding: EdgeInsets.symmetric(
                        horizontal: basePadding, vertical: 5),
                    childrenPadding: EdgeInsets.all(basePadding),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    children: [
                      Text(
                        '• Use Sunscreen: Apply broad-spectrum sunscreen with SPF 30 or higher to protect against UVA and UVB rays.\n'
                            '• Wear Protective Clothing: Use long sleeves, hats, and sunglasses to shield your skin and eyes from UV exposure.\n'
                            '• Seek Shade: Avoid direct sunlight, especially between 10 AM and 4 PM when UV rays are strongest.\n'
                            '• Stay Hydrated: Drink plenty of water to help your skin recover from UV exposure.\n'
                            '• Use After-Sun Care: Apply aloe vera or moisturizers to soothe sunburned skin and promote healing.\n'
                            '• Regular Skin Checks: Monitor your skin for unusual changes and consult a dermatologist if you notice suspicious moles or spots.\n'
                            '• Limit Tanning: Avoid tanning beds and excessive sunbathing to reduce cumulative UV damage.',
                        style: TextStyle(
                          fontSize: contentFontSize,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}