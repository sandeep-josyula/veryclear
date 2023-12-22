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
    return Scaffold(
      appBar: AppBar(
          title: const Text("VeryClear"),
          actions: [
            IconButton(
              onPressed: () => {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        width: double.infinity,
                        height: 400,
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                            child: Column(
                              children: [
                                const Text('Add an item to compare'),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Description required';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.add_shopping_cart,
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
                                              Icons.attach_money,
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
                                  children: [
                                    Expanded(
                                      child: TextFormField(
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
                                            Icons.attach_money,
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
                                    
                                      requestFocusOnTap: false,
                                      label: Text('Unit'),
                                      inputDecorationTheme:
                                          InputDecorationTheme(
                                        border: UnderlineInputBorder(),
                                      ),
                                      dropdownMenuEntries: [
                                        DropdownMenuEntry(
                                            value: 'Ounce', label: 'Ounce'),
                                        DropdownMenuEntry(
                                            value: 'Quart', label: 'Quart'),
                                        DropdownMenuEntry(
                                            value: 'Gram', label: 'Gram'),
                                        DropdownMenuEntry(
                                            value: 'Pound', label: 'Pound')
                                      ],
                                    )
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
              icon: const Icon(
                Icons.add_circle,
                color: Colors.black,
              ),
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
    );
  }
}
