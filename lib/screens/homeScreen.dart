import 'dart:convert';

import 'package:chart_app/model/agricultureData.dart';
import 'package:chart_app/services/api_services.dart';
import 'package:chart_app/widget/chartWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<AgriculturalData>> _dataFuture;
  List<AgriculturalData> _allData = [];
  List<AgriculturalData> _filteredData = [];
  String _selectedUniversity = '';

  @override
  void initState() {
    super.initState();
    _dataFuture = fetchAgriculturalData();
  }

Future<List<AgriculturalData>> fetchAgriculturalData() async {
  ApiService apiService = ApiService();
  
  try {
    final response = await apiService.fetchData();
    
    // Print the response for debugging
    print('Response Data: ${jsonEncode(response)}');
    
    if (response.containsKey('records')) {
      final List<dynamic> dataJson = response['records'];
      return dataJson.map((json) => AgriculturalData.fromJson(json)).toList();
    } else {
      print('Error: Response does not contain expected data');
      throw Exception('Failed to load data homescreen');
    }
  } catch (e) {
    print('Exception: $e');
    throw Exception('Failed to load data homescreen: $e');
  }
}


  void _filterData(String query) {
    setState(() {
      _filteredData = _allData.where((data) {
        return data.university.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
         icon: Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.of(context).pop(); // Navigate back
    },
  ),
        title: Text('Agricultural Data'),
      ),
      body: FutureBuilder<List<AgriculturalData>>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            _allData = snapshot.data!;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search for a university',
                    ),
                    onChanged: (query) => _filterData(query),
                  ),
                ),
                Expanded(
                  child: _filteredData.isEmpty
                      ? Center(child: Text('No matching universities'))
                      : ListView.builder(
                          itemCount: _filteredData.length,
                          itemBuilder: (context, index) {
                            final university = _filteredData[index];
                            return ListTile(
                              title: Text(university.university),
                              onTap: () {
                                setState(() {
                                  _selectedUniversity = university.university;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Scaffold(
                                      appBar: AppBar(
                                        title: Text('University Data'),
                                      ),
                                      body: AgriculturalChartWidget(
                                        data: _allData
                                            .where((d) => d.university == _selectedUniversity)
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
