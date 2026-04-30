
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCuYZzhNJqM2ip3UcxVhfOW1aHb_0WqvRA",
      authDomain: "trendspot-22085.firebaseapp.com",
      projectId: "trendspot-22085",
      storageBucket: "trendspot-22085.firebasestorage.app",
      messagingSenderId: "1030555954341",
      appId: "1:1030555954341:web:4288f5826be20ff0b0f14c",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthCheck(),
    );
  }
}
class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          return PhoneFrame(child: HomePage());
        } else {
          return PhoneFrame(child: LoginPage());
        }
      },
    );
  }
}
class PhoneFrame extends StatelessWidget {
  final Widget child;

  PhoneFrame({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Container(
          width: 380,
          height: 800,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(45),
            boxShadow: [
              BoxShadow(
                color: Colors.black87,
                blurRadius: 25,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Stack(
              children: [
                // YOUR APP SCREEN (LOGIN / HOME)
                child,

                // STATUS BAR (5G + BATTERY)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    color: Colors.black.withOpacity(0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "5G",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Row(
                          children: [
                            Icon(Icons.signal_cellular_4_bar,
                                color: Colors.white, size: 14),
                            SizedBox(width: 5),
                            Icon(Icons.battery_full,
                                color: Colors.white, size: 14),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}