import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Form1 extends StatefulWidget {
  const Form1({super.key});

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = new TextEditingController();
  final _NIKController = new TextEditingController();
  final _umurController = new TextEditingController();
  var _namaPasien = '';
  var _NIKPasien = '';
  var _umurPasien = '';

  void _simpanForm() async {
    final user = await FirebaseAuth.instance.currentUser;
    _formKey.currentState!.save();
    FirebaseFirestore.instance.collection('pasien').add({
      'namaPasien': _namaPasien,
      'NIK': _NIKPasien,
      'umur': _umurPasien,
      'waktu': Timestamp.now()
    });

    _namaController.clear();
    _NIKController.clear();
    _umurController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Biodata Pasien')),
      body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: _namaController,
                key: ValueKey('namaPasien'),
                decoration: InputDecoration(labelText: 'Nama'),
                onSaved: (value) {
                  _namaPasien = value!;
                },
              ),
              TextFormField(
                controller: _NIKController,
                decoration: InputDecoration(labelText: 'NIK'),
                onSaved: (value) {
                  _NIKPasien = value!;
                },
              ),
              TextFormField(
                controller: _umurController,
                decoration: InputDecoration(labelText: 'Umur'),
                onSaved: (value) {
                  _umurPasien = value!;
                },
              ),
              ElevatedButton(onPressed: _simpanForm, child: Text('Selanjutnya'))
            ]),
          )),
    );
  }
}
