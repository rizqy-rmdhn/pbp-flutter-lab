import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pbp_flutter_lab/drawer.dart';
import 'package:pbp_flutter_lab/main.dart';

class AddBudgetPage extends StatefulWidget {
    const AddBudgetPage({super.key, required this.listBudget, required this.addBudget});

    final List<Budget> listBudget;
    final Function(Budget) addBudget;

    @override
    State<AddBudgetPage> createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  String _nominal = "";
  String jenisBudget = "Pemasukkan";
  List<String> listJenisBudget = ["Pemasukkan", "Pengeluaran"];
  String tanggal = "";
  List<String> listData = [];
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Add Budget'),
            ),
            drawer: MyDrawer(
              listBudget: widget.listBudget,
              addBudget: widget.addBudget,
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                     children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Judul",
                          labelText: "Judul",
                          // Menambahkan icon agar lebih intuitif
                          icon: const Icon(Icons.title),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? judulInput) {
                          setState(() {
                            _judul = judulInput!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? judulInput) {
                          setState(() {
                            _judul = judulInput!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? judulInput) {
                          if (judulInput == "") {
                            return 'Judul tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField( // Make input integer
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText: "Nominal",
                          labelText: "Nominal",
                          // Menambahkan icon agar lebih intuitif
                          icon: const Icon(Icons.numbers),
                          // Menambahkan circular border agar lebih rapi
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(5.0),
                          // ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? nominalInput) {
                          setState(() {
                            _nominal = nominalInput!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? nominalInput) {
                          setState(() {
                            _nominal = nominalInput!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? nominalInput) {
                          if (nominalInput == "") {
                            return "Nominal tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ListTile(
                        leading: const Icon(Icons.class_),
                        title: const Text(
                          'Pilih Jenis',
                        ),
                        trailing: DropdownButton(
                          value: jenisBudget,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: listJenisBudget.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? jenisBudgetBaru) {
                            setState(() {
                              jenisBudget = jenisBudgetBaru!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                            icon:
                                Icon(Icons.calendar_today), 
                            labelText: "Tanggal" 
                            ),
                        readOnly: true, 
                        onChanged: (String? tanggalInput) {
                          setState(() {
                            tanggal = tanggalInput!;
                          });
                        },
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), // tANGGAL SEKARANG
                              firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);

                            setState(() {
                              tanggal = formattedDate;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextButton(
                        child: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            var intNominal = int.parse(_nominal); // Change into int
                            widget.addBudget(
                              Budget(
                                  _judul, intNominal, jenisBudget, tanggal),
                            );

                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: Container(
                                    child: ListView(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Center(
                                            child:
                                                const Text('Informasi Budget')),
                                        SizedBox(height: 20),
                                        // TODO: Munculkan informasi yang didapat dari form
                                        Text('Judul: $_judul'),
                                        Text('Nominal: $_nominal'),
                                        Text('Tipe: $jenisBudget'),
                                        Text('Tanggal: $tanggal'),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Kembali'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
            ),
            ),
        );
    }
}