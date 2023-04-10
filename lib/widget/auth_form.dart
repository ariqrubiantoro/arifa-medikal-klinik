import 'package:arifa_medikal_klink_3/model/auth_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn);

  final void Function(String email, String username, String password,
      bool isLogin, String nomorSTR, String role) submitFn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _udahLogin = true;
  var _userEmail = '';
  var _namaLengkap = '';
  var _userPassword = '';
  var _nomorSTR = '';
  final List<RoleType> _roleType = [
    RoleType.admin,
    RoleType.pic,
    RoleType.dokter,
  ];

  final ValueNotifier<RoleType> _roleTypeNotifier = ValueNotifier(RoleType.pic);

  void cobaMasuk() {
    final cekMasuk = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (cekMasuk) {
      _formKey.currentState!.save();
      widget.submitFn(_userEmail, _namaLengkap, _userPassword, _udahLogin,
          _nomorSTR, _roleTypeNotifier.value.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              if (!_udahLogin)
                TextFormField(
                  key: ValueKey('namaPasien'),
                  decoration: InputDecoration(labelText: 'Nama'),
                  onSaved: (value) {
                    _namaLengkap = value!;
                  },
                ),
              if (!_udahLogin)
                TextFormField(
                  key: ValueKey('str'),
                  decoration: InputDecoration(labelText: 'Nomor STR'),
                  onSaved: (value) {
                    _nomorSTR = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return 'Masukkan nomor resmi STR anda dengan benar';
                    }
                    return null;
                  },
                ),
              TextFormField(
                key: ValueKey('email'),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) {
                  _userEmail = value!;
                },
              ),
              TextFormField(
                key: ValueKey('password'),
                validator: (value) {
                  if (value!.isEmpty || value.length < 7) {
                    return 'Password minimal 7 digit kombinasi huruf dan angka.';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) {
                  _userPassword = value!;
                },
              ),
              if (!_udahLogin)
                ValueListenableBuilder(
                  valueListenable: _roleTypeNotifier,
                  builder: (context, value, child) {
                    return DropdownButtonFormField<RoleType>(
                      value: value,
                      onChanged: (value) {
                        _roleTypeNotifier.value = value!;
                      },
                      items: _roleType
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.value),
                              ))
                          .toList(),
                    );
                  },
                ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: cobaMasuk,
                  child: Text(_udahLogin ? 'Login ' : 'Daftar')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _udahLogin = !_udahLogin;
                    });
                  },
                  child: Text(_udahLogin
                      ? 'Create new account'
                      : 'I already have an account')),
              SizedBox(
                height: 12,
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
