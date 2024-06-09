class CountryModel {
  final String name;
  final String code;
  final List<String> city;
  CountryModel({
    required this.name,
    required this.city,
    required this.code,
  });
}
List<CountryModel> countryList = [
  CountryModel(
      name: "America",
      city: [
        'New York',
        "California",
      ],
      code: '+1'),
  CountryModel(
      name: "England",
      city: ['London', 'Wales'],
      code: '+2'),
  CountryModel(
      name: "Australia",
      city: ['Sydney', 'Melbourne'],
      code: '+92'),
];