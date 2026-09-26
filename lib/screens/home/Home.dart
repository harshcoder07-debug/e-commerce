import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/homenavbloc/bloc/home_nav_bloc_bloc.dart';
import 'package:shopit/bloc/homenavbloc/bloc/home_nav_bloc_event.dart';
import 'package:shopit/widgets/filterchoicechip.dart';
import 'package:shopit/widgets/productgrid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        context.read<HomeNavBlocBloc>().add(navhide());
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        context.read<HomeNavBlocBloc>().add(navshow());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Merchant", style: TextStyle(fontSize: 28)),
        ),
        drawer: Drawer(),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // heading text here
                  Text(
                    "Curated",
                    style: TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Excellence",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  // image + stack blur container
                  SizedBox(
                    height: 430,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: const DecorationImage(
                              image: AssetImage("images/hhomeimg.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //postion or secon card over it
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,

                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 200,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.06),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withValues(
                                      alpha: 0.15,
                                    ), // Refractive borders
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Summer Series 2026",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                          255,
                                          188,
                                          180,
                                          180,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "The Art of Slow\nLiving",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(15),
                                        ),
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                      ),
                                      child: Text(
                                        "Explore More",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    //new Arrival
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New Arrivals",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("See All"),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Filterchoicechip(),

                        SizedBox(height: 20),
                      ],
                    ),
                  ),

                  //coice chip categories
                ],
              ),
            ),
            const ProductGrid(),
          ],
        ),
      ),
    );
  }
}
