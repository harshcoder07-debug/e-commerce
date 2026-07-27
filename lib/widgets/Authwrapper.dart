import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/bloc/auth_bloc.dart';
import 'package:shopit/bloc/bloc/auth_state.dart';
import 'package:shopit/screens/home/home_screen.dart';
import 'package:shopit/widgets/Authscreen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
    
      listener: (context, state) {
        if (state is Authsucess) {
          ScaffoldMessenger.of(context).clearMaterialBanners();

          ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.transparent,
              elevation: 0,
              dividerColor: Colors.transparent,
              content: Align(
                alignment: Alignment.topCenter,
                child: Material(
                  elevation: 6,
                  shadowColor: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.greenAccent,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Login Successfully",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: const [SizedBox.shrink()],
            ),
          );

          Future.delayed(const Duration(milliseconds: 1500), () {
            if (context.mounted) {
              ScaffoldMessenger.of(context).clearMaterialBanners();
            }
          });
        }
      },

      builder: (context, state) {
        if (state is Authsucess) {
          return const home();
        }
        return const AuthScreen();
      },
    );
  }
}
