import 'package:flutter/material.dart';

class DriverProfileAppsPage extends StatefulWidget {
  const DriverProfileAppsPage({Key? key}) : super(key: key);

  @override
  State<DriverProfileAppsPage> createState() => _DriverProfileAppsPageState();
}

class _DriverProfileAppsPageState extends State<DriverProfileAppsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return const Scaffold(
      body: Center(
        child: Text('Driver Profile'),
      ),
    );
  }
}
