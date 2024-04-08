import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';
import 'package:http/http.dart'as http;

import 'Notification_Services.dart';

class HomeNotification extends StatefulWidget {
  const HomeNotification({super.key});
  static String id = 'HomeNotification';
  @override
  State<HomeNotification> createState() => _HomeNotificationState();
}

class _HomeNotificationState extends State<HomeNotification> {

  NotificationServices notificationServices = NotificationServices();

  @override

  void initState(){
    super.initState();

    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value)
    {
      if(kDebugMode){
        print('device token');
        print(value);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custombar(context),
      body: Center(
        child: TextButton(
          onPressed: (){
            notificationServices.getDeviceToken().then((value)async{
              var data = {
                'to': value.toString(),
                'priority':'high',
                'notification':{
                  'title':'Maya',
                  'body':'You have recived notification',
                }


              };
              await http.post(Uri.parse('https://fcm.googleapis.com/fcm.send'),
                  body:jsonEncode(data),
                  headers:{
                    'Content-Type':'application/json; charset=UTF-8',
                    'Authorization':'key=AAAAsPdec3A:APA91bGI9qpi6v1EUZAuP6QE4wLRobKpUqPH-2j5GfUddVvuaGU2GW7VWQ77oEeKETXdb0yOibSXU-s3FhZeCrMKaAqZywnYl6yWL3DQdFon4ZFMjgUzTREYHscPVgqhihI_nTcbfmMW'
                  });
            }
            );
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => NotificationServices()),
            // );

          },
          child: Text('Send Notification'),
        ),
      ),
    );
  }
}
