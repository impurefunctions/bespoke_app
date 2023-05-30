import 'package:bespoke_app/sale/screens/pay_fine_screen.dart';
import 'package:bespoke_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../domain/models/service_model.dart';

class SaleScreen extends StatefulWidget {
  final String token;
  const SaleScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {

  List<ServiceModel> serviceModels = [
    ServiceModel(serviceName: 'Charges',
      description: 'eg Traffic fines,bail, police charges',
      fees: [{
      'Fines': 1000},
        {'Bail': 500},
        {'Police Charges': 1500},
        {'Traffic Fines': 2000
    }]
    , durationDue: {
      'Duration': 30,
        },),
    ServiceModel(serviceName: 'Fees',
      description: 'eg Levies, rates, proceeds,fire arm license',
      fees: [
        {'Levy': 1000, 'Total': 1500},
      {'Firearm License': 500,},
      {'Proceeds': 1500, 'Total': 1500},
      {'Rates': 2000, 'Total': 1500},
    ]
      , durationDue: {
      'Duration': 30,
    },),
    ServiceModel(serviceName: 'Garnishee Order',
      description: 'eg Alimony, Child maintenance', fees: [
        {'Child Maintenance': 1000},
      {'Alimony': 500},
      {'Total': 1500}]
      , durationDue: {
      'Duration': 30,
    },),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay for a service'),
      ),
      body: ListView.builder(
        itemCount: serviceModels.length,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ServiceCard(token: widget.token,
              serviceModel: serviceModels[index]),
        );
      },

      ));
  }
}

class ServiceCard extends StatelessWidget {

  final ServiceModel serviceModel;
  const ServiceCard({
    super.key,
    required this.token, required this.serviceModel,
  });

  final String token;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PayFineScreen(token: token, serviceModel: serviceModel,),
          ),
        );
      },
      child: Card(
        color: const Color(0xff6200ED),
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
        elevation: 5,
        child: SizedBox(
          width: double.infinity,
          height: 100.h,
          child: Stack(
            children: [
              Positioned(
                right: 0.w,
                top: 0.h,
                child: Container(
                  width: 80.w,
                  height: 80.h,
                  margin: EdgeInsets.only(top: 10.h, right: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff340477),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10.w),
                    width: 40.w,
                    height: 40.h,
                    child: SvgPicture.asset(
                      'assets/icons/sale.svg',
                      height: 28.h,
                      width: 28.w,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20.w,
                top: 32.h,
                child: Text(
                    serviceModel.serviceName,
                    style: smallTitleFont.copyWith(
                      color: Colors.white,
                    )
                ),
              ),
              Positioned(
                left: 20.w,
                top: 64.h,
                child: Text(
                    serviceModel.description,
                    style: smallBodyFont.copyWith(
                      color: Colors.white,
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}