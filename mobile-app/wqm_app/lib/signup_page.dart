import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wqm_app/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailFieldController.dispose();
    passwordFieldController.dispose();
    super.dispose();
  }

  Future<void> createUserWithEmailAndInstance() async {
    try {
      // ignore: unused_local_variable
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailFieldController.text.trim(),
              password: passwordFieldController.text.trim());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Account created successfully,\nproceed to sign in.')),
        );
      }
      // debugPrint(userCredential as String);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 15),
              TextFormField(
                controller: emailFieldController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordFieldController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await createUserWithEmailAndInstance();
                  emailFieldController.clear();
                  passwordFieldController.clear();
                },
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.titleSmall,
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
