import 'package:firebase_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      // Sign in with email and password
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              // Sign in with email and password
              try {
                var data =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: 'yuneshshrestha24@gmail.com',
                  password: 'password',
                );
                print("Result: $data");
              } catch (e) {
                print(e);
                // show snackbar
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(e.toString()),
                ));
              }
            },
            child: const Text('Sign up with email and password'),
          ),
          ElevatedButton(
            onPressed: () async{
              // Sign in with email and password
            var data = await   FirebaseAuth.instance.signInWithEmailAndPassword(
                email: "yuneshshrestha24@gmail.com",
                password: "password",
              );
              print("Result: $data");
              // Token
              var token = await data.user!.getIdToken();
              print("Token: $token");

            },
            child: const Text('Sign in with email and password'),
          ),
        ],
      ),
    );
  }
}
