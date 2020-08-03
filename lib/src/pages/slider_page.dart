import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 300.0;
  bool _checkBlocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImage())
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      onChanged: _checkBlocked
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
      min: 10,
      max: 400,
      value: _sliderValue,
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://d.newsweek.com/en/full/1506960/rick-morty-season-4-release-date.png?w=1600&h=1200&q=88&f=d9f346aa64802a3def7f4b22b646cd51'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    // return Checkbox(
    //   value: _checkBlocked,
    //   onChanged: (value) {
    //     setState(() {
    //       _checkBlocked = value;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _checkBlocked,
      onChanged: (value) {
        setState(() {
          _checkBlocked = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _checkBlocked,
      onChanged: (value) {
        setState(() {
          _checkBlocked = value;
        });
      },
    );
  }
}
