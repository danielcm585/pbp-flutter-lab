import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/models/data_model.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key,
    required this.saveData,
    required this.datas
  });

  final String title = 'Form Budget';
  final Function(Data newData) saveData;
  final List<Data> datas;

  @override
  State<FormPage> createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = ''; 
  int nominal = 0;
  String? jenis;
  List<String> listJenis = <String>['Pemasukkan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
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
              const SizedBox(
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
              const SizedBox(
                height: 10
              ),
              DropdownButton<String>(
                value: jenis,
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                hint: const Text('Pilih Jenis'),
                items: listJenis.map<DropdownMenuItem<String>>((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item)
                )).toList(),
                onChanged: (String? value) {
                  setState(() { jenis = value!; });
                },
              ),
            ]
          ),
        )
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: SizedBox(
          width: double.maxFinite,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              )
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.saveData(Data(judul, nominal, jenis));
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Simpan',
                style: TextStyle(
                  fontSize: 15
                ),
              ),
            )
          )
        )
      ),
    );
  }
}