import 'package:employee_login/homepage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _useridController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false; // State to track loading status

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Set loading state to true
      });

      String userid = _useridController.text;
      String password = _passwordController.text;

      await Future.delayed(Duration(seconds: 1)); // Simulate a network delay

      setState(() {
        _isLoading = false; // Set loading state to false
      });

      if (userid == 'Admin@ME' && password == 'admin@123') {
        // Perform successful login action
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid user ID or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    double fontSize = screenWidth * 0.04; // Default font size multiplier
    double loginFontSize = screenWidth < 600 ? fontSize * 0.5 : fontSize * 0.4;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 180),
                  Color.fromARGB(150, 160, 95, 0),
                  Color.fromARGB(250, 131, 6, 26),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.2, 0.6, 1.0],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Image.asset(
                  'logo.png',
                  height: screenHeight * 0.15,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Moukthika Enterprises Pvt. Ltd.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    color: Color.fromARGB(255, 131, 2, 2),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double cardWidth = constraints.maxWidth < 600
                        ? constraints.maxWidth * 0.8
                        : 400;

                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: cardWidth,
                      ),
                      child: Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Employee Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: loginFontSize,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                TextFormField(
                                  controller: _useridController,
                                  decoration: InputDecoration(
                                    labelText: 'User ID',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your user ID';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: screenHeight * 0.05),
                                _isLoading
                                    ? CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 138, 16, 8),
                                        ),
                                      ) // Show loading indicator
                                    : ElevatedButton(
                                        onPressed: _login,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 85, 8, 8),
                                        ),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
