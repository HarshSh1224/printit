import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 100,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
