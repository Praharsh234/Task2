import 'package:flutter/material.dart';
import 'package:task_2/places.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});
  static String countryName = "";

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("University Finder"),
      ),
      body: Column( // Wrap the widgets in a Column
        children: [
          SizedBox(height: 30),
          Image.asset("images/image.jpg"), // The image
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (data) {
                    Myhome.countryName = data;
                  },
                  decoration: InputDecoration(
                      hintText: "Country name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              places(countryName: Myhome.countryName),
                        ),
                      );
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
