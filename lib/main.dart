import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:mainproject/card_menu.dart';
import 'package:mainproject/list_order.dart';
import 'package:sidebarx/sidebarx.dart';
import 'food_menu.dart';
import 'package:http/http.dart' as http;
import 'json_parse_exchange_rate.dart';

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
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ExchangeRate? _dataFromAPI;

  @override
  void initState() {
    super.initState();
    // getExchangeRate();
  }

  // Future<ExchangeRate?> getExchangeRate() async {
  //   const url =
  //       "https://api.apilayer.com/fixer/latest?base=THB&symbols=EUR,USD,THB";
  //   const accessToken = "Ft6rpnHvHF51ktK9WdegWz120NP36qcq";
  //   var response =
  //       await http.get(Uri.parse(url), headers: {"apikey": accessToken});
  //   _dataFromAPI = exchangeRateFromJson(response.body);
  //   return _dataFromAPI;
  // }

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  //แสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    List<SidebarXItem> itemSidebar = const [
      SidebarXItem(icon: Icons.menu_book, label: " เมนู"),
      SidebarXItem(icon: Icons.home, label: " หน้าแรก"),
    ];

    final sidebar = SidebarX(
      controller: _controller,
      items: itemSidebar,
      extendedTheme: const SidebarXTheme(width: 140),
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: _key,
      appBar: AppBar(
        // title: const Text("เมนูอาหาร"),
        title: const Text(
          "ฉ่ำชา สาขากุดป่อง",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: isSmallScreen ? sidebar : null,
      body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (!isSmallScreen) sidebar,
        Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                CardMenu(name: "กุ้งเผา", price: 50, category: "Category"),
                CardMenu(name: "กุ้งเเต้น", price: 50, category: "Category")
              ],
            ))
      ]),
      // body: const Center(child: ListOrder()),
      // body: FutureBuilder(
      //   future: getExchangeRate(),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       var result = snapshot.data;
      //       return ListView(
      //         children: [
      //           ListTile(
      //             title: Text(result.base),
      //           ),
      //           ListTile(
      //             title: Text("${result.date}"),
      //           ),
      //           ListTile(
      //             title: Text(result.rates.thb.toString()),
      //           ),
      //           ListTile(
      //             title: Text(result.rates.usd.toString()),
      //           ),
      //         ],
      //       );
      //     }
      //     return const LinearProgressIndicator();
      //   },
      // )
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8),
      //       child: FloatingActionButton(
      //         onPressed: () => setMenu(StateNumber.add),
      //         child: const Icon(Icons.add),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8),
      //       child: FloatingActionButton(
      //         onPressed: () => setMenu(StateNumber.remove),
      //         child: const Icon(Icons.remove),
      //       ),
      //     ),
      //   ],
      // ),
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
