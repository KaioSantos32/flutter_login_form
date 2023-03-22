import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final username = TextEditingController();
  final password = TextEditingController();

  void login(TextEditingController username, TextEditingController password) {
    if (username.text == "User1" && password.text == "01234") {
      showDialog(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          title: Text('Successful'),
          content: Text('Login was Successful'),
        ),
      );
      username.clear();
      password.clear();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          title: Text('Something\'s Wrong'),
          content: Text('Username or Password are incorrect'),
        ),
      );
      username.clear();
      password.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                formTitle: "Login",
                textInputLabel: "Username: User1",
                controller: username,
              ),
              Container(
                height: 30,
              ),
              Form(
                formTitle: "Password",
                textInputLabel: "Password: 01234",
                controller: password,
                obscureText: true,
              ),
              Container(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      login(username, password);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 50),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Form extends StatelessWidget {
  final String formTitle;
  final String textInputLabel;
  final TextEditingController controller;
  final bool obscureText;

  const Form(
      {super.key,
      required this.formTitle,
      required this.textInputLabel,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          formTitle,
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: textInputLabel,
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginVerification {
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("AAA"),
    );
  }
}
