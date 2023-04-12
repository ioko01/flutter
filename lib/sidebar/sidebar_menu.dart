import 'package:flutter/material.dart';
import 'package:mainproject/main.dart';
import 'package:sidebarx/sidebarx.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    List<SidebarXItem> itemSidebar = const [
      SidebarXItem(icon: Icons.menu_book, label: " เมนู"),
      SidebarXItem(icon: Icons.add, label: " เพิ่มเมนู"),
    ];

    final sidebar = SidebarX(
      controller: _controller,
      items: itemSidebar,
      theme: SidebarXTheme(
          width: sidebarWidth,
          itemMargin: EdgeInsets.zero,
          selectedItemMargin: EdgeInsets.zero,
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0)),
      animationDuration: const Duration(milliseconds: 100),
      showToggleButton: false,
      headerBuilder: (context, extended) {
        return const HeaderBuilder();
      },
    );

    return sidebar;
  }
}

class HeaderBuilder extends StatelessWidget {
  const HeaderBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey.shade100))),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        children: [
          const Image(
            fit: BoxFit.fitWidth,
            image: ExactAssetImage("assets/images/1.jpg"),
          ),
          if (isSmallScreen)
            const Text(
              "ฉ่ำชา สาขากุดป่อง",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}
