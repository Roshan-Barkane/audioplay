import 'package:flutter/material.dart';

class TabBody extends StatelessWidget {
  final Color tabVarViewColor;
  final Color menu2Color;
  final Color starColor;
  final Color loveColor;
  final List<Map<String, dynamic>>? books;

  const TabBody(
      {super.key,
      required this.tabVarViewColor,
      required this.menu2Color,
      required this.starColor,
      required this.loveColor,
      required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books == Null ? 0 : books?.length,
      itemBuilder: (context, index) {
        return Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: tabVarViewColor,
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
                        image: AssetImage(books?[index]["img"]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 24,
                            color: starColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "4.5",
                            style: TextStyle(color: menu2Color),
                          )
                        ],
                      ),
                      Text(
                        books?[index]["title"],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        books?[index]["text"],
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 70,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: loveColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "Play",
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
    );
  }
}
