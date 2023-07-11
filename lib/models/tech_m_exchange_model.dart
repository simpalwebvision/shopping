

class TechMachineExchangeModel {
  final String date;
  final String orderNo;
  final String customerName;
  final String address;
  final String emailId;
  final String contactNum;
  final String alternateNum;
  final List product;
  final List pModel;
  final List pQuantity;
  final List pPrice;
  final List pAdvance;
  final List pBalence;

  TechMachineExchangeModel(
      {required this.date,
      required this.orderNo,
      required this.address,
      required this.alternateNum,
      required this.contactNum,
      required this.customerName,
      required this.emailId,
      required this.pAdvance,
      required this.pBalence,
      required this.pModel,
      required this.pPrice,
      required this.pQuantity,
      required this.product});
}
