import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AdminScreen.dart'; // Import the AdminScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final String baseUrl = 'http://192.168.1.15:8081/Mobile_Employee_Info';
    final String userName = _usernameController.text;
    final String password = _passwordController.text;

    final response = await http.get(
      Uri.parse('$baseUrl/employee/login?userName=$userName&password=$password'),
    );

    if (response.statusCode == 200) {
      // Successful login, navigate to the AdminScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ERP_HOME_SCREEN()), // Replace with the actual screen
      );
    } else {
      // Failed login, show an error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Login failed. Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }


  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
      body: Padding(
        padding: EdgeInsets.zero,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Untitled (3).png"), fit: BoxFit.fill),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/loginnnpng.png',
                      height: 120,
                      width: 120,
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      // ... (rest of the container setup)
                      child: Column(
                        children: [
                          // ... (text form fields)
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                    prefixIcon: Icon(Icons.account_box_rounded),
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                ),
                                SizedBox(height: 24),
                                SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: _login,
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                      primary: Color(0xFF1A5288),
                                    ),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
