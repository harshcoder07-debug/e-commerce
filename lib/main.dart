import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/bloc/auth_bloc.dart';
import 'package:shopit/widgets/Authscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MerchantApp());
}

class MerchantApp extends StatelessWidget {
  const MerchantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(authrepo: null),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Merchant',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF8F8FC),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3F51D8)),
          fontFamily: 'Inter',
        ),
        home:  AuthScreen(),
      ),
    );
  }
}
