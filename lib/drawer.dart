import 'package:flutter/material.dart';
import 'package:counter_7/models/data_model.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/data.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key,
    required this.saveData,
    required this.datas
  });

  final Function(Data newData) saveData;
  final List<Data> datas;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
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
                    saveData: saveData,
                    datas: datas,
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
                    saveData: saveData,
                    datas: datas,
                  )
                ),
              );
            }
          ),
        ],
      )
    );
  }
}