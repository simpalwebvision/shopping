class AddCheckModel {
  final String checkNumber;
  final String checkAmount;
  final String? checkDate;

  AddCheckModel({
    required this.checkNumber,
    required this.checkAmount,
    this.checkDate,
  });
}
