import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(2000),
              topLeft: Radius.circular(1160)
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment(0.8,1),
              colors: <Color>[
                Color(0xff1b2f5f),
                 Color(0xff1c3163),
         //        Color(0xff3358b3),
         //        Color(0xff1c3163),
         //        Color(0xff19cb1e3),
         // Color(0x9cb1e3),
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
                SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150.0,
                          height: 210.0,
                          child: GestureDetector(
                            onTap: (){
                             // Navigator.pushReplacement(context, 'listpage');
                            },
                            child: Column(
                              children: [
                                Image.asset('assets/images/create.png',
                                 fit: BoxFit.cover,
                                                          ),
                                const Text('create Request',
                                  style:TextStyle(fontWeight: FontWeight.bold),),

                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 150.0,
                          height: 210.0,
                          child: GestureDetector(
                            onTap: (){
                              // Navigator.pushReplacement(context, 'listpage');
                            },
                            child: Column(
                              children: [
                                Image.asset('assets/images/check_2.png',
                                  fit: BoxFit.cover,),
                                const Text('check Request',
                                  style:TextStyle(fontWeight: FontWeight.bold),)
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
