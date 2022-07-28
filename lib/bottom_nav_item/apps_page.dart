import 'package:flutter/material.dart';

import '../components/apps_navigation_card.dart';
import '../modules/apps/driver_profile.dart';
import '../modules/apps/driver_settlements/driver_settlements.dart';
import '../modules/apps/preventative_maintenance.dart';



class AppsPage extends StatefulWidget {
  const AppsPage({Key? key}) : super(key: key);

  @override
  State<AppsPage> createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: Column(
        children: [
          AppsNavigationCard(
            title: 'Driver Settlements',
            description: 'View and manage driver payroll',
            icon: 'assets/icons/Union_1.png',
            navAddress: const DriverSettlementsAppsPage(),
            size: size,
          ),
          AppsNavigationCard(
            title: 'Preventative Maintenance',
            description: 'Communicate with shops to keep your truck moving',
            icon: 'assets/icons/Union.png',
            navAddress: const PreventativeMaintenanceAppsPage(),
            size: size,
          ),
          AppsNavigationCard(
            title: 'Driver Profile',
            description: 'Manage your profile',
            icon: 'assets/icons/Profile_icon.png',
            navAddress: const DriverProfileAppsPage(),
            size: size,
          ),
        ],),
    );
  }
}
