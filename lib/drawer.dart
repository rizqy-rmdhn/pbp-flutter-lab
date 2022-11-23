import 'package:flutter/material.dart';
import 'package:pbp_flutter_lab/main.dart';
import 'package:pbp_flutter_lab/page/addBudget.dart';
import 'package:pbp_flutter_lab/page/showBudget.dart';
import 'package:pbp_flutter_lab/page/showMywatchlist.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.listBudget, required this.addBudget});
  final List<Budget> listBudget;
  final Function(Budget) addBudget;

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Drawer(
          child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            listBudget: widget.listBudget,
                            addBudget: widget.addBudget,
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddBudgetPage(
                            listBudget: widget.listBudget,
                            addBudget: widget.addBudget,
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowBudgetPage(
                            listBudget: widget.listBudget,
                            addBudget: widget.addBudget,
                          )),
                );
              },
            ),
                        ListTile(
              title: const Text('My Watch List'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MywatchlistPage(
                            listBudget: widget.listBudget,
                            addBudget: widget.addBudget,
                          )),
                );
              },
            ),
          ],
        ),
      ),
    )
  );
  }
}