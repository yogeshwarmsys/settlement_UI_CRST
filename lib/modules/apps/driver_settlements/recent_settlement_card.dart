import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentSettlementsCard extends StatefulWidget {
  const RecentSettlementsCard({
    Key? key,
    required this.size,
    required this.price,
    required this.date,
    required this.deductions,
    required this.gross,
  }) : super(key: key);
  final dynamic date;
  final dynamic price;
  final dynamic deductions;
  final dynamic gross;
  final dynamic size;
  @override
  State<RecentSettlementsCard> createState() => _RecentSettlementsCardState();
}

class _RecentSettlementsCardState extends State<RecentSettlementsCard> {
  _timeConvertor(date) {
    final humanDate = DateTime.fromMillisecondsSinceEpoch(date * 1000);

    final DateFormat formatter = DateFormat('MMM dd,yyyy');
    final String formattedHumanDate = formatter.format(humanDate);

    return Text(
      formattedHumanDate.toString(),
      style: const TextStyle(
        fontSize: 12,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      height: size.height * 0.08,
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _timeConvertor(widget.date),
                Text(
                  '\$ ${widget.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Gross  ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Deductions  ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$ ${widget.gross}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '\$ ${widget.deductions}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: size.height * 0.05,
              width: size.height * 0.08,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff448BA0),
                ),
              ),
              child: const Text(
                'View',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff448BA0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
