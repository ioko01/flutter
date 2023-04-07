import 'package:flutter/material.dart';
import 'package:mainproject/list_order.dart';
import 'food_menu.dart';

enum StateNumber { add, remove }

void main(List<String> args) {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: const MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //แสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เมนูอาหาร"),
      ),
      body: const Center(child: ListOrder()),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: FloatingActionButton(
              onPressed: () => setMenu(StateNumber.add),
              child: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: FloatingActionButton(
              onPressed: () => setMenu(StateNumber.remove),
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }

  // เตรียมข้อมูล
  List<Widget> getData(int count) {
    List<Widget> data = [];
    for (var i = 0; i < count; i++) {
      // var menu = Text(
      //   "รายการที่ ${i + 1}",
      //   style: const TextStyle(fontSize: 40),
      // );
      var menu = ListTile(
        title: Text(
          "รายการที่ ${i + 1}",
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text("หัวข้อย่อยที่ ${i + 1}"),
      );

      data.add(menu);
    }

    // data.add(const Text("กดปุ่มเพื่อเพิ่มจำนวนตัวเลข"));
    // data.add(
    //   Text(
    //     "$_menu",
    //     style: const TextStyle(fontSize: 60),
    //   ),
    // );

    return data;
  }

  setMenu(StateNumber state) {
    setState(() {});
  }
}
