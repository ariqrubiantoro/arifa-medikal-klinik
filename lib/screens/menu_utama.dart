import 'package:arifa_medikal_klink_3/screens/Pasien/Form_Pendaftaran/add_pasien_profil.dart';
import 'package:arifa_medikal_klink_3/screens/detail_pasien.dart';
import 'package:arifa_medikal_klink_3/screens/formulir/form1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuUtama extends StatefulWidget {
  const MenuUtama({super.key});

  @override
  State<MenuUtama> createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
        actions: [
          DropdownButton(
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Logout')
                  ]),
                ),
                value: 'logout',
              )
            ],
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onChanged: (itemIdentifier) {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('pasien').snapshots(),
        builder: (context, pasienSnapshot) {
          if (pasienSnapshot.hasError) {
            return Text('Something went wrong');
          }
          if (pasienSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final listPasien = pasienSnapshot.data!.docs;
          return ListView.builder(
            itemCount: listPasien.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot pasienSnapshots =
                  pasienSnapshot.data!.docs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return DetailPasien(pasienSnapshots: pasienSnapshots);
                  }));
                },
                child: Card(
                  child: Column(children: [
                    Text(pasienSnapshots['namaPasien']),
                    Text(pasienSnapshots['NIK'])
                  ]),
                ),
              );
            },
          );
          // return ListView(
          //     children:
          //         pasienSnapshot.data!.docs.map((DocumentSnapshot document) {
          //   Map<String, dynamic> data =
          //       document.data()! as Map<String, dynamic>;
          //   return GestureDetector(
          //     onTap: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => DetailPasien()));
          //     },
          //     child: Card(
          //       child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Text(
          //               data['namaPasien'],
          //             ),
          //             Text(data['NIK']),
          //             Text(data['umur'])
          //           ]),
          //     ),
          //   );
          // }).toList());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          //   return Form1();
          // }));
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return AddPasienProfil();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
