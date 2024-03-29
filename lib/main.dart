// ignore_for_file: prefer_const_constructors


import 'package:arifa_medikal_klink_3/screens/auth_screen.dart';
import 'package:arifa_medikal_klink_3/screens/menu_utama.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: 'AIzaSyDGkCmmjYa6MQpnrxwrn7IshpdzOLR2UWs',
      appId: '1:603088810081:android:249b74d705f17a52f3fa20',
      messagingSenderId: '603088810081',
      projectId: 'arifa-medikal-klinik-c8675',
      storageBucket: 'arifa-medika dl-klinik-c8675.appspot.com',
    ));
  }

  await Firebase.initializeApp();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //       options: FirebaseOptions(
  //     apiKey: 'AIzaSyDGkCmmjYa6MQpnrxwrn7IshpdzOLR2UWs',
  //     appId: '1:603088810081:android:249b74d705f17a52f3fa20',
  //     messagingSenderId: '603088810081',
  //     projectId: 'arifa-medikal-klinik-c8675',
  //     storageBucket: 'arifa-medika dl-klinik-c8675.appspot.com',
  //   ));
  // } else if (Platform.isIOS) {
  //   await Firebase.initializeApp(
  //       options: FirebaseOptions(
  //     apiKey: 'AIzaSyDGkCmmjYa6MQpnrxwrn7IshpdzOLR2UWs',
  //     appId: '1:635068110518:ios:07d1f1a5d80d2741db3817',
  //     messagingSenderId: '603088810081',
  //     projectId: 'arifa-medikal-klinik-c8675',
  //     storageBucket: 'arifa-medika dl-klinik-c8675.appspot.com',
  //     iosClientId:
  //         '635068110518-unv2h39mb96ok9dusr5areoro56g0icl.apps.googleusercontent.com',
  //     iosBundleId: 'com.example.arifaMedikalKlink3',
  //   ));
  // } else {
  //   await Firebase.initializeApp(
  //       options: FirebaseOptions(
  //     apiKey: 'AIzaSyDGkCmmjYa6MQpnrxwrn7IshpdzOLR2UWs',
  //     appId: '1:603088810081:android:249b74d705f17a52f3fa20',
  //     messagingSenderId: '603088810081',
  //     projectId: 'arifa-medikal-klinik-c8675',
  //     storageBucket: 'arifa-medikal-klinik-c8675.appspot.com',
  //   ));
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Arifa Medikal Klinik',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnapshot) {
            // return KesimpulanDerajat8(
            //   idPasien: "4YjDaN6cMrDqIcPukBkL",
            // );
            if (userSnapshot.hasData) {
              return MenuUtama();
            } else {
              return AuthScreen();
            }
          },
        )

        // const AuthScreen(),
        );
  }
}

//test branch