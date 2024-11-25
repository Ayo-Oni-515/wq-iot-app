import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wqm_app/pages/signup_page.dart';
import 'package:wqm_app/pages/wqm_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailFieldController.dispose();
    passwordFieldController.dispose();
    super.dispose();
  }

  Future<void> loginUserWithEmailAndPassword() async {
    try {
      // ignore: unused_local_variable
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailFieldController.text.trim(),
              password: passwordFieldController.text.trim());
      // debugPrint(userCredential as String);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Logged in as\n${FirebaseAuth.instance.currentUser!.email}')),
        );
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const WqmHomeState()));
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
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
                  await loginUserWithEmailAndPassword();
                  emailFieldController.clear();
                  passwordFieldController.clear();
                },
                child: const Text(
                  'SIGN IN',
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
                    return SignupPage();
                  }));
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleSmall,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
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
