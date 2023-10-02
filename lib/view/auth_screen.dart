import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app_flutter/auth/firebase_auth_services.dart';
import 'package:social_app_flutter/view/main_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignup = false;
  bool isProcessing = false;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {      //validation for email
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!value.contains('@') || !value.contains('.com')) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePassword(String? value) {    //validation for password
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password should have at least 6 characters';
    }
    return null;
  }

  @override
  void dispose() {
    _userNameController.dispose();        //called dispose method
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isProcessing
          ? const Center(
              child: CircularProgressIndicator(   //progress indicator when user is switching between signIn and signUp
                color: Colors.black,
              ),
            )
          : GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      isSignup
                          ? SizedBox(
                              height: 200,
                              child: Image.asset(
                                'lib/assets/signup.jpg',
                              ),
                            )
                          : SizedBox(
                              height: 200,
                              child: Image.asset(
                                'lib/assets/signup2.jpg',
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            if (isSignup)
                              TextFormField(
                                controller: _userNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                ),
                              ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              controller: _emailController,
                              validator: _validateEmail,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              validator: _validatePassword,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              child: ElevatedButton(                            // same elevated button for signUp or signIn to go to mainScreen
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue.shade900),
                                ),
                                onPressed: () {
                                  if (isSignup) {
                                    if (_formKey.currentState!.validate()) {    //validate and proceed to signUp
                                      _signUp();
                                    }

                                    _emailController.clear();
                                    _passwordController.clear();
                                    _userNameController.clear();
                                  } else {
                                    if (_formKey.currentState!.validate()) {     //validate and proceed to signIn
                                      _signIn();
                                    }

                                    _emailController.clear();
                                    _passwordController.clear();
                                    _userNameController.clear();
                                  }
                                },
                                child: isProcessing
                                    ? const CircularProgressIndicator(
                                        color: Colors.black,
                                      )
                                    : Text(isSignup ? 'Sign Up' : 'Sign In'),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isSignup
                                      ? "Already have an account? "
                                      : "Don't have an account? ",
                                  style: const TextStyle(color: Colors.black),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _emailController.clear();
                                    _passwordController.clear();
                                    _userNameController.clear();
                                    setState(() {
                                      isProcessing = true;
                                    });
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      setState(() {
                                        isSignup = !isSignup;
                                      });
                                      setState(() {
                                        isProcessing = false;
                                      });
                                    });
                                  },
                                  child: Text(
                                    isSignup ? 'Signin' : 'Signup',    // same text button for navigation to signUp or signIn 
                                    style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 35),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Powered by ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    )),
                                Text('RaftLabs',
                                    style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _signUp() async {
    // ignore: unused_local_variable
    String username = _userNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    setState(() {
      isProcessing = true;
    });

    User? user = await _auth.signUp(email, password);

    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MainScreen(),          //MainScreen navigation
      ));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Signup failed. Please try again.'),        //snackbar alert
          duration: Duration(seconds: 2),
        ),
      );
    }
    setState(() {
      isProcessing = false;
    });
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    setState(() {
      isProcessing = true;
    });

    User? user = await _auth.signIn(email, password);

    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Signin failed. Please try again.'),          //snackbar alert
          duration: Duration(seconds: 2), 
        ),
      );
    }
    setState(() {
      isProcessing = false;
    });
  }
}
