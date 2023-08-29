import 'package:flutter/material.dart';

import 'Home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomLeft,
                colors: <Color>[Colors.lightBlue, Colors.indigo]),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        // Use the GlobalKey for the form
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // ... (your form fields and other widgets)
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an UserName';
                                    }
                                    {
                                      return 'Please enter a valid UserName';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'UserName',
                                    labelText: 'UserName',
                                    prefixIcon:
                                        Icon(Icons.account_circle_sharp),
                                    errorStyle: TextStyle(fontSize: 12.0),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Example of TextFormField
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a Password';
                                    } else if (!RegExp(r'(?=.*?[#!@$%^&*-])')
                                        .hasMatch(value)) {
                                      return 'Please enter a Strong Password';
                                    }
                                    return null;
                                  },
                                  obscureText: true, // Hide password
                                  decoration: const InputDecoration(
                                    hintText: 'Password',

                                    fillColor: Colors.grey,
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.lock),
                                    errorStyle: TextStyle(fontSize: 12.0),

                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 75,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ERP_HOME_SCREEN()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    elevation: 0,
                                    primary: Colors.transparent, // Set the background color to transparent
                                  ),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.indigo, Colors.lightBlueAccent],
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
