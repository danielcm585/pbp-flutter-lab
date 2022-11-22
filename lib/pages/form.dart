import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/components/drawer.dart';
import 'package:counter_7/pages/data.dart';
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
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: AppDrawer(
        saveData: widget.saveData,
        datas: widget.datas,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
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
              const SizedBox(
                height: 10,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  showDatePicker(
                    context: context, 
                    initialDate: date, 
                    firstDate: date.subtract(const Duration(days: 1000)), 
                    lastDate: date.add(const Duration(days: 1000))
                  ).then((selectedDate) {
                    setState(() { date = selectedDate!; });
                  });
                }, 
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(
                      color: Colors.blue,
                    )
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  )
                ),
                icon: const Icon(Icons.calendar_month), 
                label: const Text('Pilih Tanggal'),
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
                  borderRadius: BorderRadius.circular(12),
                )
              )
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.saveData(Data(judul, nominal, jenis, date));
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