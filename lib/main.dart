import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopit/Services/Apiservice.dart';
import 'package:shopit/bloc/Authbloc/auth_bloc.dart';
import 'package:shopit/bloc/filterbloc/filterbloc_bloc.dart';
import 'package:shopit/bloc/filterbloc/filterbloc_event.dart';
import 'package:shopit/bloc/homebloc/homebloc_bloc.dart';
import 'package:shopit/bloc/homebloc/homebloc_event.dart';
import 'package:shopit/bloc/homenavbloc/bloc/home_nav_bloc_bloc.dart';
import 'package:shopit/bloc/homenavbloc/bloc/home_nav_bloc_event.dart';
import 'package:shopit/bloc/homenavbloc/bloc/home_nav_bloc_state.dart';
import 'package:shopit/repository/Authrepository.dart';
import 'package:shopit/screens/Search/Search.dart';
import 'package:shopit/screens/cart/Cart.dart';
import 'package:shopit/screens/home/Home.dart';
import 'package:shopit/screens/profile/setting.dart';
import 'package:shopit/widgets/Authwrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MerchantApp());
}

class MerchantApp extends StatelessWidget {
  const MerchantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            authRepo: AuthRepository(),
          ),
        ),
        BlocProvider(
          create: (_) => HomeNavBlocBloc(),
        ),
        BlocProvider(
          create: (_) => HomeblocBloc(
            ApiService(),
          )..add(loadproducts()),
        ),
        BlocProvider(
          create: (_) => FilterBlocBloc()
            ..add(LoadCategories()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Merchant',
        theme: ThemeData(
          scaffoldBackgroundColor:
              const Color.fromARGB(251, 248, 248, 252),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF3F51D8),
          ),
          fontFamily: 'Inter',
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  static const List<Widget> screens = [
    Home(),
    search(),
    cart(),
    Setting(),
  ];

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<HomeNavBlocBloc>().add(tabchanged(0));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavBlocBloc, Navigationstate>(
      builder: (context, navState) {
        final int selectedIndex =
            navState.selectedindex.clamp(0, 3);

        return Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: Mainscreen.screens,
          ),
          bottomNavigationBar: ClipRect(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              alignment: Alignment.bottomCenter,
              child: navState.isnavvisibl
                  ? SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          12,
                          10,
                          12,
                          10,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              255,
                              253,
                              253,
                              253,
                            ),
                            borderRadius:
                                BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0xFFEAEAEA),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: List.generate(
                              4,
                              (index) {
                                final bool isSelected =
                                    selectedIndex == index;

                                final IconData icon;

                                switch (index) {
                                  case 0:
                                    icon =
                                        Icons.home_outlined;
                                    break;
                                  case 1:
                                    icon =
                                        Icons.search_outlined;
                                    break;
                                  case 2:
                                    icon =
                                        Icons.shopping_cart_outlined;
                                    break;
                                  default:
                                    icon =
                                        Icons.person_outline;
                                }

                                final String label;

                                switch (index) {
                                  case 0:
                                    label = 'Home';
                                    break;
                                  case 1:
                                    label = 'Search';
                                    break;
                                  case 2:
                                    label = 'Cart';
                                    break;
                                  default:
                                    label = 'Profile';
                                }

                                return Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (selectedIndex !=
                                          index) {
                                        context
                                            .read<
                                                HomeNavBlocBloc>()
                                            .add(
                                              tabchanged(index),
                                            );
                                      }
                                    },
                                    behavior:
                                        HitTestBehavior.opaque,
                                    child: Column(
                                      mainAxisSize:
                                          MainAxisSize.min,
                                      children: [
                                        AnimatedContainer(
                                          duration:
                                              const Duration(
                                            milliseconds: 300,
                                          ),
                                          curve:
                                              Curves.easeInOut,
                                          padding:
                                              const EdgeInsets
                                                  .symmetric(
                                            horizontal: 15,
                                            vertical: 8,
                                          ),
                                          decoration:
                                              BoxDecoration(
                                            color: isSelected
                                                ? const Color
                                                    .fromARGB(
                                                    255,
                                                    60,
                                                    128,
                                                    230,
                                                  )
                                                : Colors
                                                    .transparent,
                                            borderRadius:
                                                BorderRadius
                                                    .circular(
                                              15,
                                            ),
                                          ),
                                          child: Icon(
                                            icon,
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          label,
                                          style: TextStyle(
                                            fontSize: isSelected
                                                ? 14
                                                : 12,
                                            fontWeight:
                                                isSelected
                                                    ? FontWeight
                                                        .bold
                                                    : FontWeight
                                                        .normal,
                                            color: isSelected
                                                ? const Color(
                                                    0xFF3F51D8,
                                                  )
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}