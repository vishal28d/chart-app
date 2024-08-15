import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _universities = [
    'Acharya N.G. Ranga Agricultural University, Hyderabad',
    'Sri Venkateswara Veterinary University, Tirupati',
    'Assam Agricultural University, Jorhat',
    'Birsa Agricultural University Kanke, Ranchi',
    // Add more universities as needed
  ];
  List<String> _filteredUniversities = [
    
  ];

  @override
  void initState() {
    super.initState();
    _filteredUniversities = _universities;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _filterUniversities(String query) {
    setState(() {
      _filteredUniversities = _universities
          .where((university) =>
              university.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          
        title: const Center(
            child: Text(
          'Home Page',
          style: TextStyle(fontSize: 30),
        )),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to Chart App"),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter university name',
                contentPadding: EdgeInsets.all(5),
              ),
              onChanged: _filterUniversities,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredUniversities.length,
                itemBuilder: (context, index) {
                  final university = _filteredUniversities[index];
                  return ListTile(
                    title: Text(university),
                    onTap: () {
                      context.go(
                        '/details',
                        extra: university,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
