import 'package:flutter/material.dart';
import 'package:forms_class/app/features/signup/signup_controller.dart';
import 'package:forms_class/app/features/signup/signup_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SignupController controller;
  @override
  void initState() {
    controller = SignupController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(
                        signupController: controller,
                      ),
                    ),
                  );
                },
                child: const Text('Ir para o form'))
          ],
        ),
      ),
    );
  }
}
