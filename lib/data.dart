import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/models/data_model.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key, 
    required this.saveData,
    required this.datas
  });

  final String title = 'Data Budget';
  final Function(Data newData) saveData;
  final List<Data> datas;

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
                  MaterialPageRoute(
                    builder: (context) => FormPage(
                      saveData: widget.saveData,
                      datas: widget.datas,
                    )
                  ),
                );
              }
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => DataPage(
                      saveData: widget.saveData,
                      datas: widget.datas,
                    )
                  ),
                );
              }
            ),
          ],
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: widget.datas.map<Container>((data) => Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Text(data.title!),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.amount!.toString()),
                    Text(data.type!),
                  ],
                )
              ],
            )
          )).toList(),
        ),
      )
    );
  }
}