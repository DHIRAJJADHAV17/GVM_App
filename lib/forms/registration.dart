import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gvm_app/forms/listpage.dart';
import '../components/components.dart';

class Registration extends StatefulWidget {
  static String id = 'Registration';

  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  @override
  void initState() {
    super.initState();
    fetchNamesFromFirebase().then((List<Visitor> fetchedVisitors) {
      setState(() {
        visitors =
            fetchedVisitors; // Update the visitors list with the fetched data
        names = fetchedVisitors.map((visitor) => visitor.name).toList();
      });
    }).catchError((error) {
      print("Error fetching names: $error");
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? imageUrl;
  String? name;
  String? email;
  String? phone;
  String? reason;
  String? id;
  String? vehical;
  String? selectedAdmin;
  String? selectedGender;
  String? selectedAdminEmail;
  List<String> names = [];
  List<Visitor> visitors = [];
  Future<List<Visitor>> fetchNamesFromFirebase() async {
    List<Visitor> visitors = [];
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('admin').get();

      // Extract names and emails from documents
      querySnapshot.docs.forEach((doc) {
        String name = doc.data()['name'];
        String email = doc.data()['email'];
        visitors.add(Visitor(name: name, email: email));
      });

      return visitors;
    } catch (error) {
      // Handle error
      print("Error fetching names: $error");
      return [];
    }
  }

  List<String> genders = [
    'Male',
    'Female',
    'Other',
  ];

  final data = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: custombar(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          name = value;
                        },
                        decoration: customElevate(
                          'Enter Full Name',
                          Icons.account_box_rounded,
                        ),
                        validator: (value) {
                          // Add validation for required field
                          if (value == null || value.isEmpty) {
                            return 'Please enter full name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: customElevate('Enter email', Icons.email),
                        validator: (value) {
                          // Add validation for required field
                          if (value == null || value.isEmpty) {
                            return 'Enter email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          setState(
                            () {
                              if (value.isNotEmpty) {
                                phone = value;
                              } else {
                                print('error in parsing');
                              }
                            },
                          );
                        },
                        decoration:
                            customElevate('Enter Phone Number', Icons.phone),
                        validator: (value) {
                          // Add validation for required field
                          if (value == null || value.isEmpty) {
                            return 'Enter Phone Number';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const SizedBox(height: 10.0),
                    DropdownButtonFormField<String>(
                      value: selectedGender,
                      onChanged: (newValue) {
                        setState(() {
                          selectedGender = newValue;
                        });
                      },
                      items: genders.map((gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      decoration: customElevate('Select Gender', Icons.person),
                      validator: (value) {
                        // Add validation for required field
                        if (value == null || value.isEmpty) {
                          return 'Select Gender';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          id = value;
                        },
                        decoration: customElevate(
                            'Enter gov.id no.(adhar,pan-card)', Icons.password),
                        validator: (value) {
                          // Add validation for required field
                          if (value == null || value.isEmpty) {
                            return 'Enter the field';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    DropdownButtonFormField<String>(
                      value: selectedAdmin,
                      onChanged: (selectedVisitorName) {
                        setState(() {
                          selectedAdmin = selectedVisitorName;
                          // Find the visitor with the selected name
                          Visitor selectedVisitor = visitors.firstWhere(
                              (visitor) => visitor.name == selectedVisitorName);
                          // Store the email of the selected visitor
                          selectedAdminEmail = selectedVisitor.email;
                        });
                      },
                      items: visitors.map((visitor) {
                        return DropdownMenuItem<String>(
                          value: visitor.name,
                          child: Center(
                            // Align the text to the center
                            child: Padding(
                              // Add padding to the text
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1.0,
                                  horizontal: 20.0), // Adjust padding as needed
                              child: Text(visitor.name),
                            ),
                          ),
                        );
                      }).toList(),
                      decoration: customElevate('Select Visitor', Icons.person),
                      validator: (value) {
                        // Add validation for required field
                        if (value == null || value.isEmpty) {
                          return 'Select the Admin';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          setState(
                            () {
                              if (value.isNotEmpty) {
                                reason = value;
                              } else {
                                print('error in parsing');
                              }
                            },
                          );
                        },
                        decoration: customElevate(
                            'Enter Purpose of meeting', Icons.details),
                        validator: (value) {
                          // Add validation for required field
                          if (value == null || value.isEmpty) {
                            return 'Enter Field';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          setState(
                            () {
                              if (value.isNotEmpty) {
                                vehical = value;
                              } else {
                                print('error in parsing');
                              }
                            },
                          );
                        },
                        decoration: customElevate(
                            'Enter Vehical number', Icons.bike_scooter),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const SizedBox(height: 10.0),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            // Show loading indicator or image based on the presence of imageUrl
                            if (imageUrl == null)
                              IconButton(
                                icon: const Icon(
                                  Icons.person,
                                  size: 100,
                                ),
                                onPressed: () async {
                                  imageUrl = await uploadimg();
                                  setState(
                                      () {}); // Update the UI after image upload completes
                                },
                              ),
                            if (imageUrl != null)
                              Image.network(
                                imageUrl!, // Show the uploaded image
                                width: 100,
                                height: 100,
                              ),
                            const Text(
                              'Profile img',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            color: Colors.lightBlueAccent,
            elevation: 20.0,
            child: ElevatedButton(
              onPressed: () async {
                if (imageUrl == null) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Please upload images.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                  return;
                }
                if (_formKey.currentState!.validate()) {
                  try {
                    await data.collection('visitor').add({
                      'name': name,
                      'email': email,
                      'phone': phone,
                      'selectedAdmin': selectedAdminEmail,
                      'gender': selectedGender,
                      'reason': reason,
                      'id': id,
                      'vehical': vehical,
                      'image': imageUrl,
                      'status': "Pending",
                    });

                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        title: Text(
                          'Success',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text('Visitor created'),
                      ),
                    );

                    // Delay for 1 second and then redirect to dashboard
                    await Future.delayed(const Duration(seconds: 1));
                    Navigator.pushNamed(context, ListPages.id);
                  } catch (error) {
                    print('Error adding user to Firestore: $error');
                  }
                }
              },
              child: const Text(
                'Create Visitor',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Visitor {
  final String name;
  final String email;

  Visitor({required this.name, required this.email});
}
