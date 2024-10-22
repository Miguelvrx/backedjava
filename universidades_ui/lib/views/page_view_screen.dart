import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vista de PageView"),
      ),
      body: PageView(
        children: [
          Center(child: Text('Página 1', style: TextStyle(fontSize: 24))),
          Center(child: Text('Página 2', style: TextStyle(fontSize: 24))),
          Center(child: Text('Página 3', style: TextStyle(fontSize: 24))),
        ],
      ),
    );
  }
}
