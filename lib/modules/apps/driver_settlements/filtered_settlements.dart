import 'package:flutter/material.dart';
import 'package:settlements_animation_ui/modules/apps/driver_settlements/recent_settlement_card.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';

class FilteredSettlementsAppsPage extends StatefulWidget {
  const FilteredSettlementsAppsPage({
    Key? key,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  final dynamic startDate;
  final dynamic endDate;

  @override
  State<FilteredSettlementsAppsPage> createState() =>
      _FilteredSettlementsAppsPageState();
}

class _FilteredSettlementsAppsPageState
    extends State<FilteredSettlementsAppsPage> {
  final newFiltereSettlementList = [];

  _newFilteredSettlementList() {
    print('i am called');

    for (var x in settlemenetListJson) {
      if (widget.startDate >= x['date'] || widget.endDate <= x['date']) {
        newFiltereSettlementList.add(x);
      }
    }
    print(newFiltereSettlementList);
  }

  @override
  void initState() {
    // TODO: implement initState
    print(widget.startDate);
    print(widget.endDate);
    _newFilteredSettlementList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: ColorUtils.appBar,
        centerTitle: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.chevron_left)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.chevron_right)),
            ],
          )
        ],
        leading: IconButton(
          icon: const Text(
            'Close',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Driver Settlements',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.03,
          left: size.width * 0.04,
          right: size.width * 0.04,
        ),
        child: Column(
          children: [
            _backToRecentSettlement(),
            SizedBox(height: size.height * 0.03),
            _searchDataWidget(size),
            SizedBox(height: size.height * 0.03),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              height: size.height * 0.59,
              child: ListView.builder(
                padding: EdgeInsets.all(size.width * 0.01),
                itemCount: newFiltereSettlementList.length,
                itemBuilder: (BuildContext context, int index) {
                  return RecentSettlementsCard(
                    date: newFiltereSettlementList[index]['date'],
                    price: newFiltereSettlementList[index]['price'],
                    gross: newFiltereSettlementList[index]['gross'],
                    deductions: newFiltereSettlementList[index]['deductions'],
                    size: size,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _backToRecentSettlement() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        child: const Text(
          '< Back to Recent Settlements',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xff448BA0),
          ),
        ),
      ),
    );
  }

  _timeConvertor(date) {
    final humanDate = DateTime.fromMillisecondsSinceEpoch(date * 1000);

    final DateFormat formatter = DateFormat('MMM dd,yyyy');
    final String formattedHumanDate = formatter.format(humanDate);

    return Text(
      formattedHumanDate.toString(),
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  _searchDataWidget(size) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text(
                '40 SETTLEMENTS FOUND',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(children: [
                _timeConvertor(widget.startDate),
                const Text(
                  ' - ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _timeConvertor(widget.endDate),
              ]),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.020,
              horizontal: size.width * 0.020,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.5,
                color: const Color(0xff448BA0),
              ),
            ),
            child: const Text(
              'Modify Search',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  final settlemenetListJson = [
    {
      'date': 1293840000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1299110400,
      'price': '10,132.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1301875200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1304553600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1307318400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1309996800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1312761600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1315526400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1318204800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1320969600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1323648000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1326412800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1331769600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1334534400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1337212800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1339977600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1342656000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1345420800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1348185600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1350864000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1353628800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1356307200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1359072000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1364342400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1609286400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1367107200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1369785600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1372550400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1372636800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1375401600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1378166400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1380844800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1383609600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1386288000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1389052800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1394323200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1397088000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1399766400,
      'price': '10,132.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1402531200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1405209600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1407974400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1410739200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1413417600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1416182400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1418860800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1421625600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1426896000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1429660800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1432339200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1435104000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1443312000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1445990400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1448755200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1451433600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1451606400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1456963200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1459728000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1462406400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1465171200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1467849600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1470614400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1473379200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1476057600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1478822400,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1481500800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1484265600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1489536000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1492300800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1587513600,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1590192000,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1592956800,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    },
    {
      'date': 1595635200,
      'price': '20,432.58',
      'gross': '20,584.34',
      'deductions': '151.76',
    }
  ];
}
