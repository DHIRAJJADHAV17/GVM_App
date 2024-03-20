import 'package:flutter/material.dart';
import 'package:onkar_project/screens/loginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset('assets/image2.jpg',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  width: w,
                  height: h),
              Container(
                padding: EdgeInsets.only(
                    left: w * 0.04, right: w * 0.04, top: h * 0.15),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Signup Screen',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.red)),
                        TextFormField(
                          controller: nameController,
                          style: const TextStyle(color: Colors.green),
                          // Set text color
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: const TextStyle(color: Colors.white),
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
                              return 'Please enter your name';
                            }
                            // Add additional name validation here if needed
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Added SizedBox for spacing
                        TextFormField(
                          controller: emailController,
                          style: const TextStyle(color: Colors.green),
                          // Set text color
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: Colors.white),
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
                            // Add additional email validation here if needed
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Added SizedBox for spacing
                        // TextFormField(
                        //   controller: passwordController,
                        //   obscureText: _isObscure,
                        //   style: const TextStyle(color: Colors.green),
                        //   // Set text color
                        //   decoration: InputDecoration(
                        //     labelText: 'Password',
                        //     labelStyle: const TextStyle(color: Colors.white),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(
                        //           width: 3, color: Colors.blue),
                        //       borderRadius: BorderRadius.circular(15),
                        //     ),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide:
                        //           const BorderSide(width: 3, color: Colors.red),
                        //       borderRadius: BorderRadius.circular(15),
                        //     ),
                        //     suffixIcon: IconButton(
                        //       icon: Icon(_isObscure
                        //           ? Icons.visibility_off
                        //           : Icons.visibility),
                        //       onPressed: () {
                        //         setState(() {
                        //           _isObscure = !_isObscure;
                        //         });
                        //       },
                        //     ),
                        //   ),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter your password';
                        //     }
                        //     // Add additional password validation here if needed
                        //     return null;
                        //   },
                        // ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure,
                          style: const TextStyle(color: Colors.green),
                          // Set text color
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.white),
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
                            // Add additional password validation here if needed
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
// Added SizedBox for spacing
                        TextFormField(
                          obscureText: _isObscure,
                          style: const TextStyle(color: Colors.green),
                          // Set text color
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.red),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),
                        // Added SizedBox for spacing
                        TextFormField(
                          controller: contactController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.green),
                          // Set text color
                          decoration: InputDecoration(
                            labelText: 'Contact Number',
                            labelStyle: const TextStyle(color: Colors.white),
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
                              return 'Please enter your contact number';
                            }
                            // Add additional contact number validation here if needed
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Added SizedBox for spacing
                        SizedBox(
                          height: h * 0.07,
                          width: w * 0.5,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState != null &&
                                  _formKey.currentState!.validate()) {
                                // Perform signup operation
                                //  Navigator.push(
                                //    context,
                                //    MaterialPageRoute(
                                //      builder: (context) => MyHomePage(),
                                //   ),
                                // );
                              }
                            },
                            child: const Text('Sign Up'),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: const Text('I have account?'),
                        ),
                      ],
                    ),
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
