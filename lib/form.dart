import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  final String title = 'Form Budget';

  @override
  State<FormPage> createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = ''; 
  int nominal = 0;
  String jenis = '';
  List<String> listJenis = ['Pemasukkan', 'Pengeluaran'];

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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Judul',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() { judul = value!; });
                },
                onSaved: (String? value) {
                  setState(() { judul = value!; });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nominal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (String? value) {
                  setState(() { nominal = int.parse(value!); });
                },
                onSaved: (String? value) {
                  setState(() { nominal = int.parse(value!); });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Nominal tidak boleh kosong';
                  }
                  return null;
                },
              ),
              ListTile(
                leading: const Icon(Icons.class_),
                title: const Text(
                  'Kelas PBP',
                ),
                trailing: DropdownButton(
                  value: jenis,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: listJenis.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() { jenis = value!; });
                  },
                ),
              ),
            ]
          ),
        )
      )
    );
  }
}