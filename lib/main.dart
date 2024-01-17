import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veryclear/displayitem.dart';

void main() {
  runApp(const MyApp());
}

class ItemToCompare {
  final String description;
  final String cost;
  final double quantity;
  final String unit;
  final String multiplier;
  final String category;
  final double perunitprice;
  final double relativeDifference;

  ItemToCompare(this.description, this.cost, this.quantity, this.unit,
      this.multiplier, this.category, this.perunitprice,
      {this.relativeDifference = 0.0});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  void clearAddItemFields() {
    descriptionController.clear();
    costController.clear();
    quantityController.clear();
    unitSelectionController.clear();
    itemMultiplierController.clear();
    categorySelectionController.clear();
  }

  // This is the list that will hold the items user wants to compare.
  List<ItemToCompare> listOfItemsToCompare = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final liquidAndWeightUnits = [
      'Count',
      'Fl oz',
      'Pt',
      'Qt',
      'Gal',
      'Oz',
      'Lb',
      'g',
      'Kg',
      'in',
      'ft',
      'Yd',
      'mm',
      'cm',
      'm',
    ];

    final liquidAndWeightUnitsEntries = liquidAndWeightUnits
        .map((item) => DropdownMenuEntry<String>(
              value: item,
              label: item,
            ))
        .toList();
    final groceryItems = [
      'Bananas',
      'Apples',
      'Grapes',
      'Potatoes',
      'Carrots',
      'Onions',
      'Lettuce',
      'Tomatoes',
      'Berries',
      'Citrus Fruits',
      'Milk',
      'Cheese',
      'Yogurt',
      'Eggs',
      'Bread',
      'Pasta',
      'Rice',
      'Tortillas',
      'Cereal',
      'Chicken',
      'Beef',
      'Pork',
      'Fish',
      'Coffee',
      'Tea',
      'Soda',
      'Water',
      'Juice',
      'Ketchup',
      'Mayonnaise',
      'Mustard',
      'Salad Dressing',
      'Hot Sauce',
      'Chips',
      'Cookies',
      'Crackers',
      'Candy',
      'Nuts',
      'Popcorn',
      'Dish Soap',
      'Laundry Detergent',
      'Paper Towels',
      'Sponges',
      'Trash Bags',
      'Toilet Paper',
      'Toothpaste',
      'Shampoo',
      'Soap',
      'Deodorant'
    ];

    final dropdowngroceryItemsEntries = groceryItems
        .map((item) => DropdownMenuEntry<String>(
              value: item,
              label: item,
            ))
        .toList();

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
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.75,
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
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
                                          if (value == null || value.isEmpty) {
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
                                          if (value == null || value.isEmpty) {
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
                                    Expanded(
                                      child: DropdownMenu(
                                        hintText: 'Type to search',
                                        menuHeight: 300.0,
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
                                        dropdownMenuEntries:
                                            liquidAndWeightUnitsEntries,
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
                                        controller: itemMultiplierController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
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
                                  ],
                                ),
                                DropdownMenu(
                                  hintText: 'Type to search',
                                  menuHeight: 300.0,
                                  controller: categorySelectionController,
                                  onSelected: (String? categoryValue) {
                                    setState(
                                      () {
                                        categorySelected = categoryValue!;
                                      },
                                    );
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
                                  dropdownMenuEntries:
                                      dropdowngroceryItemsEntries,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        double calculatedQuantity = double
                                                .parse(
                                                    quantityController.text) *
                                            int.parse(
                                                itemMultiplierController.text);
                                        double calculatedPerUnitPrice =
                                            double.parse((double.parse(
                                                        costController.text) /
                                                    (double.parse(
                                                            quantityController
                                                                .text) *
                                                        int.parse(
                                                            itemMultiplierController
                                                                .text)))
                                                .toStringAsFixed(4));
                                        setState(() {
                                          listOfItemsToCompare.add(
                                            ItemToCompare(
                                              // description
                                              descriptionController.text,
                                              // cost
                                              costController.text,
                                              // quantity
                                              calculatedQuantity,
                                              // unit
                                              unitSelected,
                                              // multiplier
                                              itemMultiplierController.text,
                                              // category
                                              categorySelected,
                                              // perunitprice
                                              calculatedPerUnitPrice,
                                            ),
                                          );
                                        });

                                        // Sort items by the perunitprice property
                                        listOfItemsToCompare.sort((a, b) => a
                                            .perunitprice
                                            .compareTo(b.perunitprice));

                                        // Clear the "Add Item" form fields
                                        clearAddItemFields();
                                        Navigator.pop(context);
                                      }
                                    },
                                    label: const Text('Add Item to compare'),
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
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        itemCount: listOfItemsToCompare.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(listOfItemsToCompare[index].description),
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(
                () {
                  listOfItemsToCompare.removeAt(index);
                },
              );

              // Then show a snackbar.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item Removed'),
                ),
              );
            },
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.all(32.0),
                child: Icon(
                  Icons.delete_sweep_outlined,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            child: DisplayItem(
              itemRank: index + 1,
              relativeDifference: double.parse(
                  (((listOfItemsToCompare[index].perunitprice -
                                  listOfItemsToCompare[0].perunitprice) /
                              listOfItemsToCompare[0].perunitprice) *
                          100)
                      .toStringAsFixed(3)),
              itemdescription: listOfItemsToCompare[index].description,
              itemCost: listOfItemsToCompare[index].cost,
              itemQuantity: listOfItemsToCompare[index].quantity,
              itemUnit: listOfItemsToCompare[index].unit,
              itemMultiplier: listOfItemsToCompare[index].multiplier,
              itemCategory: listOfItemsToCompare[index].category,
              itemPerUnitPrice: listOfItemsToCompare[index].perunitprice,
            ),
          );
        },
      ),
    );
  }
}
