import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mainproject/main.dart';

class CardMenu extends StatefulWidget {
  final double width;
  final String name;
  final String? description;
  final double price;
  final String? detail;
  final String category;
  final String? image;

  const CardMenu(
      {super.key,
      required this.width,
      required this.name,
      this.description,
      required this.price,
      this.detail,
      required this.category,
      this.image});

  @override
  State<CardMenu> createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Card(
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: Text(widget.name),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String category;
  final Color color;
  const Category(
      {super.key, this.category = "", this.color = const Color(0xFF8BC34A)});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
      margin: const EdgeInsets.all(0),
      child: Text(
        category,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColorDark, fontSize: 12),
      ),
    );
  }
}
