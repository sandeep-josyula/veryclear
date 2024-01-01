import 'package:flutter/material.dart';

class DisplayItem extends StatelessWidget {
  final int itemRank;
  final String itemdescription;
  final int relativeDifference;
  final String itemCost;
  final String itemQuantity;
  final String itemUnit;
  final String itemMultiplier;
  final String itemCategory;
  final double itemPerUnitPrice;

  const DisplayItem(
      {super.key,
      required this.itemRank,
      required this.relativeDifference,
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
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.inversePrimary,
                width: 3.0,
                style: BorderStyle.solid),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                            child: Text(
                              itemdescription,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Text(
                            'Price : $itemPerUnitPrice per $itemUnit',
                          ),
                          Text(
                            'Cost  : \$$itemCost for $itemQuantity $itemUnit',
                          ),
                          Text(
                            'Type  : $itemCategory',
                          ),
                        ],
                      ),
                      // IconButton(
                      //   visualDensity: VisualDensity.comfortable,
                      //   color: Theme.of(context).colorScheme.error,
                      //   iconSize: 30,
                      //   icon: const Icon(Icons.delete_forever_outlined),
                      //   onPressed: () {
                      //     print("deleting");
                      //   },
                      // ),
                    ],
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Rank',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '$itemRank',
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.add_outlined,
                                color: Colors.red,
                              ),
                              Text('$relativeDifference%'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // const Divider(
            //   color: Colors.grey,
            //   indent: 48.0,
            //   endIndent: 48.0,
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            //             child: Text(
            //               itemdescription,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 color: Theme.of(context).colorScheme.primary,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 20.0,
            //               ),
            //             ),
            //           ),
            //           Text(
            //             'Price : $itemPerUnitPrice per $itemUnit',
            //           ),
            //           Text(
            //             'Cost  : \$$itemCost for $itemQuantity $itemUnit',
            //           ),
            //           Text(
            //             'Type  : $itemCategory',
            //           ),
            //         ],
            //       ),
            //       IconButton(
            //         visualDensity: VisualDensity.comfortable,
            //         color: Theme.of(context).colorScheme.error,
            //         iconSize: 30,
            //         icon: const Icon(Icons.delete_forever_outlined),
            //         onPressed: () {
            //           print("deleting");
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
