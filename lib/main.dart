import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pully_auth_flutter/mani_auth_plugin.dart';
import 'package:pully_auth_flutter/scr/model/residence_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                      CupertinoPageRoute<(String, String)?>(
                        builder: (context) {
                          return ManiAuth(
                            locale: Locale('uz'),
                            paymentSystemId:
                                '', // this should will be given by PULLY
                            isProd: false,
                            residenceType: ResidenceType.resident,
                            pinfl: '31308977420022',
                            phoneNumber: '+998917940243',
                          );
                        },
                      ),
                    )
                    .then((token) {
                      print(token);
                    });
              },
              child: Text("Open Pully SDK"),
            ),
          ],
        ),
      ),
    );
  }
}
