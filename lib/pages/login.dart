import 'package:flutter/material.dart';
import 'package:login_app/pages/home.dart';
import 'package:login_app/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: _nameController),
            TextField(controller: _emailController),
            ElevatedButton(
              child: Text('Create'),
              onPressed: () async {
                final name = _nameController.text;
                final email = _emailController.text;
                final response = await loginProvider.login(name, email);
                if (response.token!.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              title: "title",
                            )),
                  );
                } else {
                  const snackBar = SnackBar(
                    content: Text('invalid username and password'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
