import 'package:flutter/material.dart';
import 'package:gvm_app/forms/listpage.dart';
import 'package:gvm_app/forms/registration.dart';

import '../components/components.dart';
class DashboardScreen extends StatefulWidget {
  static String id = 'dashboardscreen';
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custombar(context),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(2000),
              topLeft: Radius.circular(1160)),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff1b2f5f),
              Color(0xff1c3163),
            ],
            // tileMode: Tilemode.mirror,
          ),
        ),
        child: Center(
          child: SafeArea(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150.0,
                          height: 210.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Registration.id);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/create.png',
                                  fit: BoxFit.cover,
                                ),
                                const Text(
                                  'create Request',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.0,
                          height: 210.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, ListPages.id);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/check_2.png',
                                  fit: BoxFit.cover,
                                ),
                                const Text(
                                  'check Request',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
 }


// class DashboardScreen extends StatelessWidget{
//   static const String id ='dashboard_screen';
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   validateAndSave() {
//     final FormState? form = _formKey.currentState;
//     if (form!.validate()) {
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: custombar(context),
//       body: SingleChildScrollView(
//
//         child: Column(
//           children: [
//             Form(
//               key: _formKey,
//               child: Container(
//                 decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       colors: [
//                         Colors.lightBlueAccent,
//                         Colors.lightBlueAccent,
//                        // Colors.lightBlueAccent
//                       ],
//                     )
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 200,),
//                     const Padding(
//                       padding: EdgeInsets.all(20.0),
//                     ),
//                     const SizedBox(height: 30,),
//                     Container(
//                       decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(70),
//                               topRight: Radius.circular(70))
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(25),
//
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 SizedBox(
//                                   width: 150.0,
//                                   height: 210.0,
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       Navigator.pushNamed(context, Registration.id);
//                                     },
//                                     child: Column(
//                                       children: [
//                                         Image.asset(
//                                           'assets/images/create.png',
//                                           fit: BoxFit.cover,
//                                         ),
//                                         const Text(
//                                           'create Request',
//                                           style: TextStyle(fontWeight: FontWeight.bold),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 150.0,
//                                   height: 210.0,
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       Navigator.pushNamed(context, ListPages.id);
//                                     },
//                                     child: Column(
//                                       children: [
//                                         Image.asset(
//                                           'assets/images/check_2.png',
//                                           fit: BoxFit.cover,
//                                         ),
//                                         const Text(
//                                           'check Request',
//                                           style: TextStyle(fontWeight: FontWeight.bold),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }