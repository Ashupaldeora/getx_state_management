import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CardsContainer extends StatelessWidget {
  CardsContainer(
      {super.key,
      required this.title,
      required this.gradient,
      required this.body,
      required this.itemCount,
      required this.tags});
  String title, body;
  int itemCount;
  List tags;
  LinearGradient gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textAlign: TextAlign.center,
            title,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 23)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  // color: Colors.yellow,
                  alignment: Alignment.center,
                  height: 300,
                  child: Text(
                    textAlign: TextAlign.justify,
                    body,
                    // overflow: TextOverflow.clip,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                  ),
                ),
              ),
              SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: itemCount,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "# ${tags[index]}",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12)),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
