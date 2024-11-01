import 'package:flutter/material.dart';
import 'audio/app_color.dart' as AppColors;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  ImageIcon(
                    AssetImage("assetName"),
                    size: 24,
                    color: Colors.black,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
