import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/Authbloc/auth_bloc.dart';
import 'package:shopit/bloc/Authbloc/auth_event.dart' show AuthUserLogoutChanged;
import 'package:shopit/bloc/Authbloc/auth_state.dart';
import 'package:shopit/widgets/Authwrapper.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authlogout) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const AuthWrapper()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () =>
                context.read<AuthBloc>().add(AuthUserLogoutChanged()),
            child: const Text("logout"),
          ),
        ),
      ),
    );
  }
}
