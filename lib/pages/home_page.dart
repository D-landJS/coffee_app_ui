import 'package:coffee_app_ui/util/coffee_tile.dart';
import 'package:coffee_app_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List cofeeTypes = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ]
  ];
  // user tapped on coffee types
  void coffeTypeSelected(int index) {
    setState(() {
      for (var i = 0; i < cofeeTypes.length; i++) {
        cofeeTypes[i][1] = false;
      }
      cofeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
                child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.oswald(fontSize: 35.0),
            )),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Find your coffee..",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cofeeTypes.length,
                itemBuilder: (context, index) {
                  return CofeeType(
                    coffeeType: cofeeTypes[index][0],
                    isSelected: cofeeTypes[index][1],
                    onTap: () {
                      coffeTypeSelected(index);
                    },
                  );
                },
              )),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeTile(
                coffeeImagePath: 'assets/images/latte.jpg',
                coffeeName: 'Latte',
                coffeePrice: '4.20',
              ),
              CoffeTile(
                coffeeImagePath: 'assets/images/cappucino.jpg',
                coffeeName: 'Capuccino',
                coffeePrice: '3.20',
              ),
              CoffeTile(
                coffeeImagePath: 'assets/images/milk.jpg',
                coffeeName: 'Milk',
                coffeePrice: '2.20',
              )
            ],
          ))
        ],
      ),
    );
  }
}
