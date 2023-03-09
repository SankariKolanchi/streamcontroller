import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<String> streamController = StreamController<String>();
  late Stream<String> dataStream;
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    dataStream = streamController.stream.asBroadcastStream();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
                stream: dataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data ?? 'Null Data',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return const Text(
                      'NoData',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    );
                  }
                }),
            StreamBuilder<String>(
                stream: dataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data ?? 'Null Data',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return const Text(
                      'NoData',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    );
                  }
                }),
            SizedBox(height: 20),
            SizedBox(width: 200, child: TextField(
              controller: textEditingController,
            )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  streamController.add(textEditingController.text);
                },
                child: Text('Done'))
          ],
        ),
      ),
    ));
  }
}
