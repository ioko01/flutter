import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:intl/intl.dart';

class CardMenu extends StatelessWidget {
  String name;
  String? description;
  double price;
  String? detail;
  String category;
  String? image;

  CardMenu(
      {super.key,
      required this.name,
      this.description,
      required this.price,
      this.detail,
      required this.category,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 0)
      ]),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              print(name);
            },
            onHover: (value) {
              print(value);
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FillImageCard(
                width: 200,
                imageProvider: AssetImage(image ?? "assets/images/3.jpg"),
                tags: [Text(category)],
                title: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                description: Text(description ?? "-"),
                footer:
                    Text("ราคา: ${NumberFormat("#,###").format(price)} บาท"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
