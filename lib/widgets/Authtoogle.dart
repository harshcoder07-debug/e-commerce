import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/Authbloc/auth_bloc.dart';
import 'package:shopit/bloc/Authbloc/auth_event.dart';
import 'package:shopit/bloc/Authbloc/auth_state.dart';

class AuthToggle extends StatelessWidget {
  const AuthToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 243, 239, 239),
            borderRadius: BorderRadius.circular(25),
          ),
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      context.read<AuthBloc>().add(ShowLogin());
                    },
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 250),
                      decoration: BoxDecoration(
                        color: state.isLogin
                            ? const Color.fromARGB(255, 251, 251, 251)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: state.isLogin
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: state.isLogin
                                ? const Color.fromARGB(255, 12, 38, 210)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //second container
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      context.read<AuthBloc>().add(ShowSignup());
                    },
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 350),
                      decoration: BoxDecoration(
                        color: !state.isLogin
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          "Signup",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: !state.isLogin
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: !state.isLogin
                                ? const Color.fromARGB(255, 12, 38, 210)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
