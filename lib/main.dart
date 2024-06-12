import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/ResponseProvider.dart';
import 'Screens/ResponseScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LeadProvider(),
      child: MaterialApp(
        home: LeadListScreen(),
      ),
    );
  }
}
