import 'package:flutter/material.dart';
import 'package:pbp_flutter_lab/page/addBudget.dart';
import 'package:pbp_flutter_lab/drawer.dart';

void main() {
  runApp(const MyApp());
}

class Budget {
  final String judul;
  final int nominal;
  final String jenisBudget;
  final String tanggal;
  Budget(this.judul, this.nominal, this.jenisBudget, this.tanggal);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.

  final List<Budget> listBudget = <Budget>[];

  void addBudget(Budget budget) {
    setState(() {
      listBudget.add(budget);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        listBudget: listBudget,
        addBudget: addBudget,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key, required this.listBudget, required this.addBudget});

    final String title = 'Flutter Lab';
    final List<Budget> listBudget;
    final Function(Budget) addBudget;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isDecrementAvailable = false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;

      if (!_isDecrementAvailable) {
        _isDecrementAvailable = true;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (_counter > 1) {
        _counter--;
      }
      else if (_counter == 1) {
        _counter--;
        _isDecrementAvailable = false;
      }
      else {
        _counter = _counter;
      }
    });
  }
  
  Widget getGanjilGenap() {

    const ganjil = Text('GANJIL', style: TextStyle(color: Colors.blue));
    const genap = Text('GENAP', style: TextStyle(color: Colors.red));

    if (_counter % 2 == 0) {
      return genap;
    } else {
      return ganjil;
    }
  }
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
  appBar: AppBar(
    title: Text(widget.title),
  ),
  // Menambahkan drawer menu
  drawer: MyDrawer(
    listBudget: widget.listBudget,
    addBudget: widget.addBudget,
  ),
  body: Center(
    // Center is a layout widget. It takes a single child and positions it
    // in the middle of the parent.
    child: Column(
      // Column is also a layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        getGanjilGenap(),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    ),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  floatingActionButton: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[Visibility(
        visible: _isDecrementAvailable,
        child: FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
      ),
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ]
    ) // This trailing comma makes auto-formatting nicer for build methods.
  ));
  }
}
