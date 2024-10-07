import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

void main() {
  runApp(App());
}

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: _Home(),
    );
  }
}

final class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  late final StreamController<int> _wheelController;

  @override
  void initState() {
    super.initState();

    _wheelController = StreamController<int>()..add(3);
  }

  @override
  void dispose() {
    _wheelController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 200,
            child: FortuneWheel(
              selectionStream: _wheelController.stream,
              items: List.generate(
                20,
                (index) => FortuneItem(
                  style: FortuneItemStyle(
                    borderWidth: 0,
                    gradient: index % 2 == 0
                        ? LinearGradient(
                            colors: [
                              Color(0xFF50DBFF),
                              Color(0xFF2069FF),
                            ],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                          )
                        : null,
                    color: Colors.white,
                  ),
                  child: Text(
                    'Text Test',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
