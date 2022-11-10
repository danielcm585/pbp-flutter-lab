import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  final String title = 'Data Budget';

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: 
        Column(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              }
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const FormPage()),
                );
              }
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const DataPage()),
                );
              }
            ),
          ],
        )
      ),
      body: Column(
        children: <Widget>[
          
        ]
      ),
    );
  }
}