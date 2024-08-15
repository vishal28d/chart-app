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

  factory AgriculturalData.fromJson(Map<String, dynamic> json) {
    return AgriculturalData(
      state: json['states'],
      university: json['agricultural_university'],
      year: json['_year'],
      stateAllocation: double.tryParse(json['state_allocation']) ?? 0.0,
      stateExpenditure: double.tryParse(json['_state_expenditure']) ?? 0.0,
      icarAllocation: double.tryParse(json['_icar_allocation']) ?? 0.0,
      icarExpenditure: double.tryParse(json['_icar_expenditure']) ?? 0.0,
      otherSourcesAllocation: double.tryParse(json['other_sources_allocation']) ?? 0.0,
      otherSourcesExpenditure: double.tryParse(json['_other_sources_expenditure']) ?? 0.0,
      totalAllocation: double.tryParse(json['_total_allocation']) ?? 0.0,
      totalExpenditure: double.tryParse(json['_total_expenditure']) ?? 0.0,
    );
  }
}
