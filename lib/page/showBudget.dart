import 'package:flutter/material.dart';
import 'package:pbp_flutter_lab/drawer.dart';
import 'package:pbp_flutter_lab/main.dart';

class ShowBudgetPage extends StatefulWidget {
  const ShowBudgetPage({super.key, required this.listBudget, required this.addBudget});
  final List<Budget> listBudget;
  final Function(Budget) addBudget;

  @override
  State<ShowBudgetPage> createState() => _ShowBudgetPageState();
}

class _ShowBudgetPageState extends State<ShowBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),

      // Menambahkan drawer menu
      drawer: MyDrawer(
        listBudget: widget.listBudget,
        addBudget: widget.addBudget,
      ),

      body: ListView.builder(
          itemCount: widget.listBudget.length,
          itemBuilder: (BuildContext context, int index) {
            var budgetTitle = widget.listBudget[index].judul;
            var date = widget.listBudget[index].tanggal;
            return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                  side: const BorderSide(color: Colors.black, width: 0.3),
                ),
                trailing: Text(widget.listBudget[index].jenisBudget),
                subtitle: Text(widget.listBudget[index].nominal.toString()),
                
                title: Text('$budgetTitle - $date'));
          }),
    );
  }
}