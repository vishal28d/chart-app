class AgriculturalData {
  final String state;
  final String university;
  final String year;
  final double stateAllocation;
  final double stateExpenditure;
  final double icarAllocation;
  final double icarExpenditure;
  final double otherSourcesAllocation;
  final double otherSourcesExpenditure;
  final double totalAllocation;
  final double totalExpenditure;

  AgriculturalData({
    required this.state,
    required this.university,
    required this.year,
    required this.stateAllocation,
    required this.stateExpenditure,
    required this.icarAllocation,
    required this.icarExpenditure,
    required this.otherSourcesAllocation,
    required this.otherSourcesExpenditure,
    required this.totalAllocation,
    required this.totalExpenditure,
  });

  // Helper function to safely parse double values, ignoring commas and handling invalid formats
  static double _parseDouble(String? value) {
    if (value == null || value.isEmpty) {
      return 0.0;
    }
    // Remove commas and non-numeric characters
    value = value.replaceAll(',', '').trim();
    return double.tryParse(value) ?? 0.0;
  }

  factory AgriculturalData.fromJson(Map<String, dynamic> json) {
    return AgriculturalData(
      state: json['states'] ?? '',
      university: json['agricultural_university'] ?? '',
      year: json['_year'] ?? '',
      stateAllocation: _parseDouble(json['state_allocation']),
      stateExpenditure: _parseDouble(json['_state_expenditure']),
      icarAllocation: _parseDouble(json['_icar_allocation']),
      icarExpenditure: _parseDouble(json['_icar_expenditure']),
      otherSourcesAllocation: _parseDouble(json['other_sources_allocation']),
      otherSourcesExpenditure: _parseDouble(json['_other_sources_expenditure']),
      totalAllocation: _parseDouble(json['_total_allocation']),
      totalExpenditure: _parseDouble(json['_total_expenditure']),
    );
  }
}
