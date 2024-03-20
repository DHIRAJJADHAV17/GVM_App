import 'package:flutter/material.dart';
import 'package:gvm_app/Dashboard/Dashboard_Screen.dart';

//import 'HomePage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'loginscreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('assets/images/image2.jpg',
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
                width: w,
                height: h),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    left: w * 0.04, right: w * 0.04, top: h * 0.14),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Login Screen',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        SizedBox(height: h * 0.03),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(color: Colors.green),
                          // Set text color
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.red),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // Add additional email validation if needed
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure,
                          style: TextStyle(color: Colors.green),
                          // Set text color
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.red),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            // Add additional password validation if needed
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ButtonTheme(
                          minWidth: double.infinity,
                          // Set the width to match_parent
                          child: SizedBox(
                            width: w * 0.5,
                            height: h * 0.07,
                            child: ElevatedButton(
                              onPressed: () {
                                // if (_formKey.currentState != null &&
                                //     _formKey.currentState!.validate()) {
                                // Perform signup operation
                                Navigator.pushNamed(
                                    context, DashboardScreen.id);
                                // }
                              },
                              child: const Text('Login'),
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
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please enter your email to reset your password.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform password reset operation
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
