import 'dart:convert';
import 'package:audiobook/my_tabs.dart';
import 'package:flutter/material.dart';
import 'audio/app_color.dart' as AppColors;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // Change to List<Map<String, dynamic>>? to hold a list of maps
  List<Map<String, dynamic>>? popularbooks;
  List<Map<String, dynamic>>? books;
  // controller
  late ScrollController _scrollController;
  late TabController _tabController;

  // Read data from JSON file
  void ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/popularBooks.json")
        .then(
      (s) {
        setState(() {
          // Decode JSON and assign as a List<Map<String, dynamic>>
          popularbooks = List<Map<String, dynamic>>.from(json.decode(s));
        });
      },
    );
    await DefaultAssetBundle.of(context).loadString("json/books.json").then(
      (s) {
        setState(() {
          // Decode JSON and assign as a List<Map<String, dynamic>>
          books = List<Map<String, dynamic>>.from(json.decode(s));
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
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
                        Icon(Icons.notifications_active),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
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
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: -20,
                      right: 0,
                      child: Container(
                        height: 180,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.8),
                          itemCount:
                              popularbooks == null ? 0 : popularbooks!.length,
                          itemBuilder: (_, i) {
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(popularbooks![i]["img"]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (context, isScoller) {
                    return [
                      SliverAppBar(
                        backgroundColor: AppColors.silverBackground,
                        pinned: true,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(30),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 20),
                            child: TabBar(
                              indicatorPadding: EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: EdgeInsets.all(0),
                              controller: _tabController,
                              isScrollable: false,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.green.withOpacity(0.2),
                                        blurRadius: 7,
                                        offset: Offset(0, 0))
                                  ]),
                              tabs: [
                                AppTabs(
                                    color: AppColors.menu1Color, text: "New"),
                                AppTabs(
                                    color: AppColors.menu2Color,
                                    text: "Popular"),
                                AppTabs(
                                    color: AppColors.menu3Color,
                                    text: "Trending"),
                              ],
                            ),
                          ),
                        ),
                      )
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: books == null ? 0 : books?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 0, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.tabVarViewColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: Offset(0, 0),
                                      blurRadius: 2,
                                    ),
                                  ]),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image:
                                              AssetImage(books?[index]["img"]),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 24,
                                              color: AppColors.starColor,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "4.5",
                                              style: TextStyle(
                                                  color: AppColors.menu2Color),
                                            )
                                          ],
                                        ),
                                        Text(
                                          books?[index]["title"],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          books?[index]["text"],
                                          style: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Container(
                                          width: 70,
                                          height: 25,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.loveColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: const Text(
                                            "love",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Material(
                        child: const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          title: Text("Context"),
                        ),
                      ),
                      Material(
                        child: const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          title: Text("Context"),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
