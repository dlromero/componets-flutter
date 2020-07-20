import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: _createButton(),
    );
  }

  Widget _createButton() {
    return FloatingActionButton(
      key: Key('animation'),
      child: Icon(Icons.play_arrow),
      onPressed: _animate,
    );
  }

  void _animate() {
    final generateNumbers = Random();
    setState(() {
      _width = generateNumbers.nextInt(300).toDouble();
      _height = generateNumbers.nextInt(300).toDouble();
      _color = Color.fromRGBO(generateNumbers.nextInt(255),
          generateNumbers.nextInt(255), generateNumbers.nextInt(255), 1);
      _borderRadius =
          BorderRadius.circular(generateNumbers.nextInt(100).toDouble());
    });
  }
}
