import 'package:flutter/material.dart';

class RechargeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recharge App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RechargePage(),
    );
  }
}

class RechargePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Recharge',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // Add your notification icon onPressed logic here
            },
          ),
        ],
        centerTitle: true,
      ),
    );
  }
}
