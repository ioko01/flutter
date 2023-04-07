import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mainproject/food_menu.dart';

//สร้าง Widget ต้นแบบ
class ListOrder extends StatelessWidget {
  const ListOrder({super.key});

  @override
  Widget build(BuildContext context) {
    List<FoodMenu> menu = [
      FoodMenu("กุ้งเผา", "500", "images/1.jpg"),
      FoodMenu("กะเพราหมูสับ", "80", "images/3.jpg"),
    ];

    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (BuildContext context, int index) {
        FoodMenu food = menu[index];
        return ListTile(
          leading: Image.asset(food.image),
          title: Text(
            food.name,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text(
              "ราคา: ${NumberFormat("#,###").format(int.tryParse(food.price))} บาท"),
          onTap: () {
            print("คุณเลือกเมนู: ${food.name}");
          },
        );
      },
    );
  }
}
