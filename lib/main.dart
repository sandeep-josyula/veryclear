import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veryclear/displayitem.dart';

// TODO: After a user submits an item, the values of the field should be cleared

void main() {
  runApp(const MyApp());
}

class ItemToCompare {
  final String description;
  final String cost;
  final String quantity;
  final String unit;
  final String multiplier;
  final String category;
  final double perunitprice;

  ItemToCompare(this.description, this.cost, this.quantity, this.unit,
      this.multiplier, this.category, this.perunitprice);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
        useMaterial3: true,
        textTheme: GoogleFonts.spaceMonoTextTheme(),
      ),
      home: const AppLandingPage(),
    );
  }
}

class AppLandingPage extends StatefulWidget {
  const AppLandingPage({super.key});

  @override
  State<AppLandingPage> createState() => _AppLandingPageState();
}

class _AppLandingPageState extends State<AppLandingPage> {
  final _formKey = GlobalKey<FormState>();

  final descriptionController = TextEditingController();
  final costController = TextEditingController();
  final quantityController = TextEditingController();
  final unitSelectionController = TextEditingController();
  final itemMultiplierController = TextEditingController();
  final categorySelectionController = TextEditingController();

  late String unitSelected = '';
  late String categorySelected = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    descriptionController.dispose();
    costController.dispose();
    quantityController.dispose();
    itemMultiplierController.dispose();
    super.dispose();
  }

  List<ItemToCompare> listOfItemsToCompare = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          // leading: const Icon(
          //   Icons.wb_sunny_outlined,
          //   color: Colors.redAccent
          // ),
          title: const Text("VeryClear"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: ElevatedButton.icon(
                label: const Text('Add Item'),
                icon: const Icon(
                  Icons.add_circle_outlined,
                  color: Colors.black,
                ),
                onPressed: () => {
                  showModalBottomSheet(
                    // backgroundColor: Colors.white,
                    elevation: 40.0,
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          width: double.infinity,
                          height: screenHeight * 0.50,
                          child: Form(
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: descriptionController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Description required';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.add_shopping_cart_outlined,
                                        color: Colors.black,
                                      ),
                                      hintText: 'Ex: "Moo" Brand Organic Eggs',
                                      hintStyle: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      labelText: 'Item Description',
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: costController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Cost required';
                                            }
                                            return null;
                                          },
                                          keyboardType: const TextInputType
                                              .numberWithOptions(
                                            decimal: true,
                                            signed: false,
                                          ),
                                          decoration: const InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.attach_money_outlined,
                                              color: Colors.black,
                                            ),
                                            hintText: 'Ex: \$16.79',
                                            hintStyle: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            labelText: 'Cost',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: quantityController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Quantity required';
                                            }
                                            return null;
                                          },
                                          keyboardType: const TextInputType
                                              .numberWithOptions(
                                            decimal: true,
                                            signed: false,
                                          ),
                                          decoration: const InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.scale_outlined,
                                              color: Colors.black,
                                            ),
                                            hintText: 'Ex: 12',
                                            hintStyle: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            labelText: 'Quantity',
                                          ),
                                        ),
                                      ),
                                      DropdownMenu(
                                        controller: unitSelectionController,
                                        onSelected: (String? unitValue) {
                                          setState(() {
                                            unitSelected = unitValue!;
                                          });
                                        },
                                        enableFilter: true,
                                        requestFocusOnTap: true,
                                        leadingIcon: const Icon(
                                          Icons.search_outlined,
                                          color: Colors.black,
                                        ),
                                        label: const Text('Unit'),
                                        inputDecorationTheme:
                                            const InputDecorationTheme(
                                          border: UnderlineInputBorder(),
                                        ),
                                        dropdownMenuEntries: const [
                                          DropdownMenuEntry(
                                            value: 'Count',
                                            label: 'Count',
                                          ),
                                          DropdownMenuEntry(
                                            value: 'Ounce',
                                            label: 'Ounce',
                                          ),
                                          DropdownMenuEntry(
                                            value: 'Gram',
                                            label: 'Gram',
                                          ),
                                          DropdownMenuEntry(
                                            value: 'Pound',
                                            label: 'Pound',
                                          ),
                                          DropdownMenuEntry(
                                            value: 'Gallon',
                                            label: 'Gallon',
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: itemMultiplierController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Item Count Required';
                                            }
                                            return null;
                                          },
                                          keyboardType: const TextInputType
                                              .numberWithOptions(
                                            decimal: false,
                                            signed: false,
                                          ),
                                          decoration: const InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.stacked_bar_chart_outlined,
                                              color: Colors.black,
                                            ),
                                            hintText: 'Ex : 2 Pack',
                                            hintStyle: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            labelText: 'Item Multiplier',
                                          ),
                                        ),
                                      ),
                                      DropdownMenu(
                                        controller: categorySelectionController,
                                        onSelected: (String? categoryValue) {
                                          setState(() {
                                            categorySelected = categoryValue!;
                                          });
                                        },
                                        enableFilter: true,
                                        requestFocusOnTap: true,
                                        leadingIcon: const Icon(
                                          Icons.search_outlined,
                                          color: Colors.black,
                                        ),
                                        label: const Text('Category'),
                                        inputDecorationTheme:
                                            const InputDecorationTheme(
                                          border: UnderlineInputBorder(),
                                        ),
                                        dropdownMenuEntries: const [
                                          DropdownMenuEntry(
                                            value: 'Vegetables',
                                            label: 'Vegetables',
                                          ),
                                          DropdownMenuEntry(
                                            value: 'Eggs',
                                            label: 'Eggs',
                                          ),
                                          DropdownMenuEntry(
                                            value: 'Pasta',
                                            label: 'Pasta',
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        print("--- New Item Added ---");
                                        print(descriptionController.text);
                                        print(costController.text);
                                        print(quantityController.text);
                                        print(unitSelected);
                                        print(itemMultiplierController.text);
                                        print(categorySelected);
                                        print(double.parse(
                                                costController.text) /
                                            double.parse(costController.text));
                                        setState(() {
                                          listOfItemsToCompare.add(
                                              ItemToCompare(
                                                  descriptionController.text,
                                                  costController.text,
                                                  quantityController.text,
                                                  unitSelected,
                                                  itemMultiplierController.text,
                                                  categorySelected,
                                                  double.parse(
                                                          costController.text) /
                                                      double.parse(
                                                          quantityController
                                                              .text)));
                                        });

                                        print(listOfItemsToCompare);

                                        Navigator.pop(context);
                                      },
                                      label: Text('Add Item to compare'),
                                      icon: const Icon(
                                        Icons.add_circle_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                },
              ),
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ListView.builder(
            itemCount: listOfItemsToCompare.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return DisplayItem(
                itemdescription: listOfItemsToCompare[index].description,
                itemCost: listOfItemsToCompare[index].cost,
                itemQuantity: listOfItemsToCompare[index].quantity,
                itemUnit: listOfItemsToCompare[index].unit,
                itemMultiplier: listOfItemsToCompare[index].multiplier,
                itemCategory: listOfItemsToCompare[index].category,
                itemPerUnitPrice: listOfItemsToCompare[index].perunitprice,
              );
            }));
  }
}
