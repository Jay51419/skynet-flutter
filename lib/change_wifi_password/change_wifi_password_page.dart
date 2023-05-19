import 'package:flutter/material.dart';

class ChangeWifiPasswordPage extends StatelessWidget {
  const ChangeWifiPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black38,
                  size: 30,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
