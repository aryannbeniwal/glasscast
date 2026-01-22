import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:glasscast/screens/auth_screen.dart';
import 'package:glasscast/screens/home_screen.dart';
import 'package:glasscast/config/supabase_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase (commented out for now until credentials are added)
  // await Supabase.initialize(
  //   url: SupabaseConfig.supabaseUrl,
  //   anonKey: SupabaseConfig.supabaseAnonKey,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glasscast',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

