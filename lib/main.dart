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
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) {
                      return ManiAuth(
                        locale: Locale('ru'),
                        paymentSystemId: '6d56a2ca-151d-4fee-9176-914d1e81c9df',
                        isProd: false,
                        residenceType: ResidenceType.resident,
                        pinfl: '',
                      );
                    },
                  ),
                );
              },
              child: Text("Open Pully SDK"),
            ),
          ],
        ),
      ),
    );
  }
}
