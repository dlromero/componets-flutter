import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _numberList = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
      itemCount: _numberList.length,
      itemBuilder: (context, index) {
        final image = _numberList[index];
        return FadeInImage(
            placeholder: AssetImage('data/assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/seed/$image/500/300'));
      },
    );
  }
}
