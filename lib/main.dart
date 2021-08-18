import 'package:blockchain_explorer/view_model/blockchain_viewmodel.dart';
import 'package:blockchain_explorer/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Blockchain Explorer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(providers: [
          ChangeNotifierProvider(create: (_) => BlockchainViewModel()),
        ], child: HomeView()));
  }
}
