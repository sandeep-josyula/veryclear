import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
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

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          title: const Text("VeryClear"),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                label: const Text('Add Item'),
                icon: const Icon(
                  Icons.add_circle_outlined,
                  color: Colors.black,
                ),
                onPressed: () => {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
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
                                  20.0, 8.0, 20.0, 8.0),
                              child: Column(
                                children: [
                                  TextFormField(
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
                                      hintText:
                                          'Example : "Moo" Brand Organic Milk',
                                      hintStyle: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      labelText: 'Item Description',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
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
                                              hintText: '',
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
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
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
                                            hintText: '',
                                            hintStyle: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            labelText: 'Quantity',
                                          ),
                                        ),
                                      ),
                                      const DropdownMenu(
                                        enableFilter: true,
                                        requestFocusOnTap: true,
                                        leadingIcon: Icon(
                                          Icons.search_outlined,
                                          color: Colors.black,
                                        ),
                                        label: Text('Unit'),
                                        inputDecorationTheme:
                                            InputDecorationTheme(
                                          border: UnderlineInputBorder(),
                                        ),
                                        dropdownMenuEntries: [
                                          DropdownMenuEntry(
                                              value: 'Ounce', label: 'Ounce'),
                                          DropdownMenuEntry(
                                              value: 'Gram', label: 'Gram'),
                                          DropdownMenuEntry(
                                              value: 'Pound', label: 'Pound'),
                                          DropdownMenuEntry(
                                              value: 'Gallon', label: 'Gallon'),
                                        ],
                                      )
                                    ],
                                  ),
                                  const DropdownMenu(
                                    enableFilter: true,
                                    requestFocusOnTap: true,
                                    leadingIcon: Icon(
                                      Icons.search_outlined,
                                      color: Colors.black,
                                    ),
                                    label: Text('Category'),
                                    inputDecorationTheme: InputDecorationTheme(
                                      border: UnderlineInputBorder(),
                                    ),
                                    dropdownMenuEntries: [
                                      DropdownMenuEntry(
                                          value: 'Ounce', label: 'Vegetables'),
                                      DropdownMenuEntry(
                                          value: 'Gram', label: 'Eggs'),
                                      DropdownMenuEntry(
                                          value: 'Pound', label: 'Pasta')
                                    ],
                                  ),
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
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
    );
  }
}
