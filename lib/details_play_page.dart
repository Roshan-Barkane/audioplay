import 'package:flutter/material.dart';
import 'audio/app_color.dart' as AppColors;

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({super.key});

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.audioBluiseBackground,
      body: Stack(
        children: [
          // top area color is blue
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: screenHeight / 1.5,
            child: Container(
              color: Colors.blue.shade500,
            ),
          ),
          // box to contain back button and search button
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
          // main container top show audio function
          Positioned(
            right: 0,
            left: 0,
            top: screenHeight * 0.20,
            height: screenHeight * 0.34,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  const Text(
                    "The Water Wares",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Avenir"),
                  ),
                  const Text(
                    "Martin Hytt",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          //audio image box
          Positioned(
            top: screenHeight * 0.12,
            left: (screenWidth - 150) / 2,
            right: (screenWidth - 150) / 2,
            height: screenHeight * 0.17,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.audioGrayBackground,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 5),
                    image: const DecorationImage(
                        image: AssetImage("img/pic-1.jpg"), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
