import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              child: Text('ערוצים'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/movies');
              },
              child: Text('סרטים'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('סדרות'),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}