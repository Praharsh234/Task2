import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class places extends StatefulWidget {
  final String countryName;

  const places({Key? key, required this.countryName}) : super(key: key);

  @override
  State<places> createState() => _placesState();
}

class _placesState extends State<places> {
  Future<List<dynamic>> getUniversities() async {
    final response = await http.get(
      Uri.parse('http://universities.hipolabs.com/search?country=${widget.countryName}'),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load universities');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Universities in ${widget.countryName}'),
        ),
        body: Center(
          child: FutureBuilder<List<dynamic>>(
            future: getUniversities(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Use the data retrieved from the API here
                List<dynamic> universities = snapshot.data!;
                return ListView.builder(
                  itemCount: universities.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(universities[index]['name']),
                      subtitle: Text(universities[index]['country']),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
