import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';

class MyDoFormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDoFormState();
}

class _MyDoFormState extends State<MyDoFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Daftar"),
        leading: IconButton(
          icon: Icon(LineIcons.arrow_left),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Judul',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Icon(LineIcons.file_text),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Tanggal',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Icon(LineIcons.calendar),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ])),
        ),
      ),
    );
  }
}
