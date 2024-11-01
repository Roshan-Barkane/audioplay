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
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage("assets/manu.png"),
                      size: 24,
                    ),
                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.notifications_active)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Popular Books",
                      style: TextStyle(fontSize: 26),
                    ),
                  )
                ],
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
