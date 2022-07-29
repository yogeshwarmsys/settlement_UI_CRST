import 'package:flutter/material.dart';
import 'package:settlements_animation_ui/homepage/homepage.dart';
import 'package:settlements_animation_ui/modules/apps/driver_profile.dart';
import 'package:settlements_animation_ui/modules/apps/driver_settlements/recent_settlement_card.dart';
import 'package:settlements_animation_ui/modules/apps/driver_settlements/search_settlement_widget.dart';

import '../../../main.dart';

bool isScreenOnBottom = false;

class DriverSettlementsAppsPage extends StatefulWidget {
  const DriverSettlementsAppsPage({Key? key}) : super(key: key);

  @override
  State<DriverSettlementsAppsPage> createState() =>
      _DriverSettlementsAppsPageState();
}

class _DriverSettlementsAppsPageState extends State<DriverSettlementsAppsPage> {
  int _selectedIndex = 4;
  var _scrollController;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    isScreenOnBottom = false;
    super.initState();
  }

  _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      setState(() {
        print('Reached bottom');
        isScreenOnBottom = true;
        //_loadAnimationWidget(MediaQuery.of(context).size);
      });
    }
    if (_scrollController.offset <=
        _scrollController.position.minScrollExtent) {
      setState(() {
        print('Reached top');
        isScreenOnBottom = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    isScreenOnBottom = false;
    super.dispose();
  }

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      isScreenOnBottom = false;
    });
    return false;
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      isScreenOnBottom = true;
    });
    return true;
  }

  _onEndScroll(ScrollMetrics metrics) {
    setState(() {
      isScreenOnBottom = true;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
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
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          isScreenOnBottom
              ? _loadAnimationWidget(size)
              : Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.03,
                      left: size.width * 0.04,
                      right: size.width * 0.04),
                  child: Column(
                    children: [
                      !isScreenOnBottom
                          ? _totalEarningWidget(size)
                          : const SizedBox.shrink(),
                      SizedBox(height: size.height * 0.02),
                      !isScreenOnBottom
                          ? FilteredSettlementsWidgetPage(size: size)
                          : const SizedBox.shrink(),
                      SizedBox(height: size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: const [
                            Text(
                              'RECENT SETTLEMENTS',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollStartNotification) {
                            _onStartScroll(scrollNotification.metrics);
                          } else if (scrollNotification
                              is ScrollUpdateNotification) {
                            _onUpdateScroll(scrollNotification.metrics);
                          } else if (scrollNotification
                              is ScrollEndNotification) {
                            _onEndScroll(scrollNotification.metrics);
                          }
                          return false;
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                          height: size.height * 0.45,
                          child: ListView.builder(
                            //controller: _scrollController,
                            padding: EdgeInsets.all(size.width * 0.01),
                            addAutomaticKeepAlives: true,
                            itemCount: settlemenetListJson.length,
                            itemBuilder: (BuildContext context, int index) {
                              return RecentSettlementsCard(
                                date: settlemenetListJson[index]['date'],
                                price: settlemenetListJson[index]['price'],
                                gross: settlemenetListJson[index]['gross'],
                                deductions: settlemenetListJson[index]
                                    ['deductions'],
                                size: size,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/Combined_Shape@2x.png'),
            ),
            label: 'Workflow',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/Combined_Shape@3x_1.png'),
            ),
            label: 'HOS',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/i/wrench@3x.png'),
            ),
            label: 'DVIR',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/Combined_Shape@3x_2.png'),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/Combined_Shape@3x_3.png'),
            ),
            label: 'Apps',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  _totalEarningWidget(size) {
    return TweenAnimationBuilder<double>(
      // 1. add a Duration
      duration: const Duration(milliseconds: 1000),
      // 2. add a Tween
      tween: Tween(begin: 4.0, end: 1.0),
      builder: (context, value, child) {
        // 5. apply some transform to the given child
        return Transform.translate(
          offset: Offset(value * 200 - 200, 0),
          child: child,
        );
      },
      child: Container(
        height: size.height * 0.1,
        width: size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                  horizontal: size.width * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Total 2023',
                      style: TextStyle(
                        color: Color(0xff004F62),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Earnings To Date',
                      style: TextStyle(
                        color: Color(0xff004F62),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                '\$ 55,235.23',
                style: TextStyle(
                  color: Color(0xff004F62),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// Load Animated widget positions
  Widget _loadAnimationWidget(var size) {
    print('entering animation widget');

    return Column(
      children: [
        TweenAnimationBuilder<double>(
          // 1. add a Duration
          duration: const Duration(milliseconds: 500),
          // 2. add a Tween
          tween: Tween(begin: 2.0, end: 1.0),
          builder: (context, value, child) {
            // 5. apply some transform to the given child
            return Transform.translate(
              offset: Offset(value * 200 - 200, 0),
              child: child,
            );
          },
          child: Row(
            children: [
              Image.asset(
                'assets/icons/Search@3x.png',
                height: size.height * 0.05,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Total 2023',
                      style: TextStyle(
                        color: Color(0xff004F62),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Earnings To Date',
                      style: TextStyle(
                        color: Color(0xff004F62),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.width * 0.02),
              const Text(
                '\$ 55,235.23',
                style: TextStyle(
                  color: Color(0xff004F62),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: const [
              Text(
                'RECENT SETTLEMENTS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            height: size.height * 0.62,
            child: ListView.builder(
              controller: _scrollController,
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              padding: EdgeInsets.all(size.width * 0.01),
              itemCount: settlemenetListJson.length,
              itemBuilder: (BuildContext context, int index) {
                return RecentSettlementsCard(
                  date: settlemenetListJson[index]['date'],
                  price: settlemenetListJson[index]['price'],
                  gross: settlemenetListJson[index]['gross'],
                  deductions: settlemenetListJson[index]['deductions'],
                  size: size,
                );
              },
            ),
          ),
        )
      ],
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
