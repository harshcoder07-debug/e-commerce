import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/Services/Apiservice.dart';
import 'package:shopit/bloc/Authbloc/auth_bloc.dart';
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
        BlocProvider(create: (_) => AuthBloc(authRepo: AuthRepository())),
        BlocProvider(create: (context) => HomeNavBlocBloc()),
        BlocProvider(
          create: (context) => HomeblocBloc(ApiService())..add(loadproducts()),
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Merchant',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF8F8FC),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3F51D8)),
          fontFamily: 'Inter',
        ),
        home: AuthWrapper(),
      ),
    );
  }
}

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});
  // list of screens
  static const List<Widget> _screens = [Home(), search(), cart(), Setting()];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavBlocBloc, Navigationstate>(
      builder: (context, navselectstate) {
        return Scaffold(
          body: IndexedStack(
            index: navselectstate.selectedindex,
            children: _screens,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    blurStyle: BlurStyle.outer,
                    color: Colors.blue,
                    offset: Offset(3, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 253, 253, 253),
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFEAEAEA),
                    width: 1,
                  ), // Optional top border line
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  //selctiuon set
                  final bool isselected = navselectstate.selectedindex == index;
                  //icon seted
                  final IconData icon = index == 0
                      ? Icons.home_outlined
                      : index == 1
                      ? Icons.search_outlined
                      : index == 2
                      ? Icons.shopping_cart
                      : Icons.person;
                  //lable set
                  final String label = index == 0
                      ? 'Home'
                      : index == 1
                      ? 'Search'
                      : index == 2
                      ? 'Cart'
                      : 'Profile';
                  return GestureDetector(
                    onTap: () {
                      context.read<HomeNavBlocBloc>().add(tabchanged(index));
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isselected
                                ? const Color.fromARGB(255, 60, 128, 230)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                icon,
                                color: isselected
                                    ? const Color.fromARGB(255, 253, 253, 253)
                                    : const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: isselected ? 14 : 12,
                            fontWeight: isselected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isselected
                                ? const Color(0xFF3F51D8)
                                : const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
