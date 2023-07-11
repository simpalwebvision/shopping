import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shopping/utils/constant.dart';

class OrderFormTitle extends StatelessWidget {
  final Size sSize;
  final String title;
  const OrderFormTitle({super.key, required this.title, required this.sSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: sSize.width * 0.035,
          color: Colors.red,
        ),
      ),
    );
  }
}

class OrderFormFooter extends StatelessWidget {
  final Size sSize;
  final ByteData data;

  const OrderFormFooter({
    super.key,
    required this.sSize,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'CHEQUE RETURN CHARGES Rs. 350/- ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: sSize.width * 0.025,
              color: Colors.red,
            ),
          ),
          Text(
            ' CONVEYANCE CHARGES Rs. 150/-',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: sSize.width * 0.025,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderFormDetailTextFormHelper extends StatelessWidget {
  final Size sSize;
  final String title, detail;
  final TextEditingController ctl;
  final bool rOnly;
  final VoidCallback? onTap;
  const OrderFormDetailTextFormHelper(
      {super.key,
      required this.title,
      required this.sSize,
      required this.detail,
      required this.ctl,
      this.rOnly = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: sSize.width * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
              child: TextFormField(
            onTap: onTap,
            style: const TextStyle(color: Colors.black),
            controller: ctl,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 3.0),
              isDense: true,
            ),
            minLines: 1,
            maxLines: 4,
          ))
        ]);
  }
}

class OrderFormDetailHelper extends StatelessWidget {
  final Size sSize;
  final String title, detail;
  const OrderFormDetailHelper(
      {super.key,
      required this.title,
      required this.sSize,
      required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: sSize.width * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            detail,
            style: TextStyle(
              fontSize: sSize.width * 0.03,
            ),
          ),
        ]);
  }
}

class OrderProperFormDetailHelper extends StatelessWidget {
  final Size sSize;
  final String title, detail;
  const OrderProperFormDetailHelper(
      {super.key,
      required this.title,
      required this.sSize,
      required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(
                fontSize: sSize.width * 0.033,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              detail,
              style: TextStyle(
                fontSize: sSize.width * 0.03,
              ),
            ),
          ),
        ]);
  }
}

class OrderFormHead extends StatelessWidget {
  final Size sSize;
  final String headName;
  const OrderFormHead({super.key, required this.sSize, required this.headName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AppImageUrl().appLogoImage,
              width: sSize.width * 0.2,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    headName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: sSize.width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  // SizedBox(height: 5),
                  // Text(
                  //   'G-49, Arihant Shopping Centre, Opp. Rly Station, Nalasopara (East),Palghar - 401 209.',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              width: sSize.width * 0.2,
            ),
          ],
        ),
        SizedBox(height: sSize.height * 0.005),
        Text(
          'G-49, Arihant Shopping Centre, Opp. Rly Station,\nNallasopara (East),Palghar - 401 209.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: sSize.width * 0.027,
          ),
        ),
        SizedBox(height: sSize.height * 0.005),
        Text(
          'Helpline No. 8484814515/9702113771\nEmail : shahilenterprises2016@gmail com Website : www.aquanerio.com',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: sSize.width * 0.027,
          ),
        ),
      ],
    );
  }
}

class GSTFormHead extends StatelessWidget {
  final Size sSize;
  final String headName;
  const GSTFormHead({super.key, required this.sSize, required this.headName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AppImageUrl().appLogoImage,
              width: sSize.width * 0.2,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    headName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: sSize.width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  // SizedBox(height: 5),
                  // Text(
                  //   'G-49, Arihant Shopping Centre, Opp. Rly Station, Nalasopara (East),Palghar - 401 209.',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              width: sSize.width * 0.2,
            ),
          ],
        ),
        SizedBox(height: sSize.height * 0.005),
        Text(
          '47, Shashwat Avenue, Global City, Virar (W) Palghar - 401303, Maharashtra, India.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: sSize.width * 0.027,
          ),
        ),
        SizedBox(height: sSize.height * 0.005),
        Text(
          'Cust Care No. 9702113771 / 8484814515',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: sSize.width * 0.027,
          ),
        ),
        SizedBox(height: sSize.height * 0.005),
        Text(
          'Website - aquanerio.in / Email-aquanerio@gmail.com',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: sSize.width * 0.027,
          ),
        ),
        SizedBox(height: sSize.height * 0.005),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'GST No. : 27ABFFA0656C1ZV',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sSize.width * 0.027,
              ),
            ),
            Text(
              'PAN No. ABFFA0656C',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sSize.width * 0.027,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LocationHelplineWidget extends StatelessWidget {
  const LocationHelplineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: darkPrimaryColor)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(size.width * 0.02),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: darkPrimaryColor))),
              child: Text(
                'Your Location Helpline',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: darkPrimaryColor))),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.005),
                      decoration: const BoxDecoration(
                          border: Border(
                              right: BorderSide(color: darkPrimaryColor))),
                      child: Column(
                        children: [
                          Text(
                            'Mira Road',
                          ),
                          SizedBox(height: size.height * 0.005),
                          Text(
                            '7387265856',
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.005),
                      decoration: const BoxDecoration(
                          border: Border(
                              right: BorderSide(color: darkPrimaryColor))),
                      child: Column(
                        children: [
                          Text(
                            'Nallasopara (East)',
                          ),
                          SizedBox(height: size.height * 0.005),
                          Text(
                            '8983117982',
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Vasai',
                        ),
                        SizedBox(height: size.height * 0.005),
                        Text(
                          '8983116604',
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: size.height * 0.005),
                    decoration: const BoxDecoration(
                        border:
                            Border(right: BorderSide(color: darkPrimaryColor))),
                    child: Column(
                      children: [
                        Text(
                          'Virar + Nallasopara (West)',
                        ),
                        SizedBox(height: size.height * 0.005),
                        Text(
                          '7219007270',
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: size.height * 0.005),
                    child: Column(
                      children: [
                        Text(
                          'Naigaon / Bhayander & Other',
                        ),
                        SizedBox(height: size.height * 0.005),
                        Text(
                          '9730910119',
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
