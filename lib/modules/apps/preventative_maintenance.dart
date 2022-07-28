import 'package:flutter/material.dart';

class PreventativeMaintenanceAppsPage extends StatefulWidget {
  const PreventativeMaintenanceAppsPage({Key? key}) : super(key: key);

  @override
  State<PreventativeMaintenanceAppsPage> createState() =>
      _PreventativeMaintenanceAppsPageState();
}

class _PreventativeMaintenanceAppsPageState
    extends State<PreventativeMaintenanceAppsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return const Scaffold(
      body: Center(
        child: Text('Preventative Maintenance'),
      ),
    );
  }
}
