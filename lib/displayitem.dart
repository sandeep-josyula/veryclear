import 'package:flutter/material.dart';

class DisplayItem extends StatelessWidget {
  final String itemdescription;
  final String itemCost;
  final String itemQuantity;
  final String itemUnit;
  final String itemMultiplier;
  final String itemCategory;
  final double itemPerUnitPrice;

  const DisplayItem(
      {super.key,
      required this.itemdescription,
      required this.itemCost,
      required this.itemQuantity,
      required this.itemUnit,
      required this.itemMultiplier,
      required this.itemCategory,
      required this.itemPerUnitPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                  child: Text(
                    itemdescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Rank -',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '3231',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              indent: 8.0,
              endIndent: 8.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price : $itemPerUnitPrice per $itemUnit',
                      ),
                      Text(
                        'Cost  : \$$itemCost for $itemQuantity $itemUnit',
                      ),
                      Text(
                        'Type  : $itemCategory',
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
