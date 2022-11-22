import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:counter_7/components/drawer.dart';
import 'package:counter_7/models/data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Program Counter';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _parity = "GENAP";
  List<Data> datas = <Data>[];

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter%2 == 1) {
        _parity = "GANJIL";
      } else {
        _parity = "GENAP";
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter-1 < 0) return;
      _counter--;
      if (_counter%2 == 1) {
        _parity = "GANJIL";
      } else {
        _parity = "GENAP";
      }
    });
  }

  void saveData(Data newData) {
    log(newData.date.toString());
    datas.add(newData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: AppDrawer(
        saveData: saveData,
        datas: datas,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _parity,
              style: (_parity == "GANJIL") ? 
                const TextStyle(color: Colors.blue) : 
                const TextStyle(color: Colors.red)
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Visibility(
              visible: (_counter != 0),
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          ),
        ],
      )
    );
  }
}
