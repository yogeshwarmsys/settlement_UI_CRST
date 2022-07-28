import 'package:flutter/material.dart';

class AppsNavigationCard extends StatefulWidget {
  const AppsNavigationCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.navAddress,
    required this.size,
  }) : super(key: key);

  final String title;
  final String description;
  final String icon;
  final dynamic navAddress;
  final dynamic size;
  @override
  State<AppsNavigationCard> createState() => _AppsNavigationCardState();
}

class _AppsNavigationCardState extends State<AppsNavigationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.size.height * 0.02,
        horizontal: widget.size.width * 0.02,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: widget.size.height * 0.1,
                    width: widget.size.width * 0.15,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle, color: Color(0xffb004f62)),
                    child: ImageIcon(
                      AssetImage(widget.icon),
                      size: widget.size.height * 0.08,
                      color: Colors.amberAccent[700],
                    ),
                  ),
                  SizedBox(width: widget.size.width * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: widget.size.width * 0.6,
                        child: Text(
                          widget.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => widget.navAddress),
                  );
                },
                child: Image.asset(
                  'assets/icons/chevron_right@2x.png',
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
