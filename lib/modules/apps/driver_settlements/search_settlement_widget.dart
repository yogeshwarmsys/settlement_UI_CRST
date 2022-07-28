import 'package:flutter/material.dart';

import 'filtered_settlements.dart';

class FilteredSettlementsWidgetPage extends StatefulWidget {
  const FilteredSettlementsWidgetPage({
    Key? key,
    required this.size,
  }) : super(key: key);
  final dynamic size;
  @override
  State<FilteredSettlementsWidgetPage> createState() =>
      _FilteredSettlementsWidgetPageState();
}

class _FilteredSettlementsWidgetPageState
    extends State<FilteredSettlementsWidgetPage> {
  int startDate = 1432339200;
  int endDate = 1484265600;

  _filter() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilteredSettlementsAppsPage(
          startDate: startDate,
          endDate: endDate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: InkWell(
        onTap: _filter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/Search@3x.png',
              height: size.height * 0.05,
            ),
            SizedBox(width: size.width * 0.05),
            const Text(
              'Search for Settlements',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff448BA0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
