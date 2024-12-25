import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Image.network(
        "https://firebasestorage.googleapis.com/v0/b/fir-a2f0b.appspot.com/o/covers%2FCalvin%20Harris%20%2CDua%20Lipa%20-%20one%20kisss.jpg?alt=media&token=20f9d22c-1c47-46d1-a7da-31728d7da6c4",
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, color: Colors.red, size: 50),
              SizedBox(height: 8),
              Text('Failed to load image', style: TextStyle(fontSize: 16)),
            ],
          );
        },
      ),) ,
    );
  }
}