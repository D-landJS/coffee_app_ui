import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;

  const CoffeTile(
      {Key? key,
      required this.coffeeImagePath,
      required this.coffeeName,
      required this.coffeePrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(child: Image.asset(coffeeImagePath)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coffeeName, style: GoogleFonts.oswald(fontSize: 20)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('With Almond Milk',
                      style: GoogleFonts.oswald(color: Colors.grey[700]))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$$coffeePrice',
                    style: GoogleFonts.oswald(),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Icon(Icons.add))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
