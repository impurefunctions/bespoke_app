import 'package:bespoke_app/sale/domain/models/service_model.dart';
import 'package:bespoke_app/utils/utils.dart';
import 'package:checkmark/checkmark.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'card_payment.dart';

class PayFineScreen extends StatefulWidget {
  final String token;
  final ServiceModel serviceModel;

  const PayFineScreen({Key? key, required this.token, required this.serviceModel}) : super(key: key);

  @override
  State<PayFineScreen> createState() => _PayFineScreenState();
}

class _PayFineScreenState extends State<PayFineScreen> {

  String buttonText = 'Tap Card';

  ValueNotifier<dynamic> result = ValueNotifier(null);
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
    decimalDigits: 2,
    symbol: 'P ',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.serviceModel.serviceName),
      ),
      body: ListView.separated(
        itemCount: widget.serviceModel.fees.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.lightBlueAccent[100],
            child: ListTile(
              title: Text(widget.serviceModel.fees[index].keys.first),
              subtitle: Text(widget.serviceModel.fees[index].values.first.toString()),
              trailing: ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) => Dialog(
                    child: Container(
                      color: Colors.lightBlueAccent[100],
                      height: 200,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Select Payment Option',
                                    style: bodyFont,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //QR Code
                          ListTile(
                            //iconColor: context.isDarkMode ? Colors.black : Colors.white,
                            leading: Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: context.isDarkMode ? Colors.white : Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(5.h),
                                  color: context.isDarkMode
                                      ? Colors.transparent
                                      : const Color(0xffE4E9EC),
                                ),
                                // color: Color(0xffD1E9FF),
                                child: Icon(
                                  Icons.qr_code_scanner,
                                  opticalSize: 24.w,
                                  color: context.isDarkMode ? Colors.white : Colors.black,
                                )),
                            title: const Text('QR Code'),
                            trailing: const Icon(Icons.chevron_right_sharp),
                            onTap: () {
                              if (true) {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent[100],
                                          borderRadius: BorderRadius.circular(10.w),
                                        ),
                                          padding: EdgeInsets.all(10.w),
                                          height: 400.h,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Price: ${_formatter.format(widget.serviceModel.fees[index].values.first.toString())}',
                                                style: mediumTitleFont.copyWith(
                                                  color: context.isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                              Text(
                                                'Scan QR Code',
                                                style: mediumTitleFont.copyWith(
                                                  color: context.isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                              Expanded(
                                                child: MobileScanner(
                                                    allowDuplicates: false,
                                                    controller: MobileScannerController(
                                                        facing: CameraFacing.back, torchEnabled: false),
                                                    onDetect: (barcode, args) {
                                                      if (barcode.rawValue == null) {
                                                        debugPrint('Failed to scan Barcode');
                                                      } else {
                                                        final String code = barcode.rawValue!;
                                                        debugPrint('Barcode found! $code');
                                                      }
                                                    }),
                                                /*child: QrImage(
                                                  foregroundColor: context.isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  data:
                                                  'This QR code has an embedded image as well',
                                                  version: QrVersions.auto,
                                                  size: 320,
                                                  gapless: false,
                                                  // embeddedImage: const AssetImage('images/logo.png'),
                                                  embeddedImageStyle: QrEmbeddedImageStyle(
                                                    size: Size(80.h, 80.w),
                                                  ),
                                                ),*/
                                              ),
                                            ],
                                          )
                                        /* MobileScanner(
                          allowDuplicates: false,
                          controller: MobileScannerController(
                              facing: CameraFacing.back, torchEnabled: false),
                          onDetect: (barcode, args) {
                            if (barcode.rawValue == null) {
                              debugPrint('Failed to scan Barcode');
                            } else {
                              final String code = barcode.rawValue!;
                              debugPrint('Barcode found! $code');
                            }
                          }),*/
                                      );
                                    });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter an amount'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                          ),
                          //NFC
                          ListTile(
                            leading: Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(

                                  border: Border.all(
                                    color: context.isDarkMode ? Colors.white : Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(5.h),
                                  color: Colors.lightBlueAccent[100],
                                ),
                                // color: Color(0xffD1E9FF),
                                child: Icon(
                                  color: context.isDarkMode ? Colors.white : Colors.black,
                                  Icons.contactless_rounded,
                                  opticalSize: 24.w,
                                )),
                            title: const Text('Tap Card'),
                            trailing: const Icon(Icons.chevron_right_sharp),
                            onTap: () {
                              if (true) {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context, StateSetter setState) {
                                        return FutureBuilder<bool>(
                                          future: NfcManager.instance.isAvailable(),
                                          builder: (context, snapshot) => snapshot.data != true
                                              ? Center(
                                              child: SvgPicture.asset(
                                               'assets/images/no_nfc.svg',
                                                height: 200.h,
                                                width: 200.w,
                                              ))
                                              : Flex(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            direction: Axis.vertical,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Price: ${_formatter.format(widget.serviceModel.fees[index].values.first)}',
                                                    style: mediumTitleFont.copyWith(
                                                      color: context.isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Flexible(
                                                flex: 2,
                                                child: Container(
                                                  margin: EdgeInsets.all(4.w),
                                                  constraints:
                                                  const BoxConstraints.expand(),
                                                  decoration:
                                                  BoxDecoration(border: Border.all()),
                                                  child: SingleChildScrollView(
                                                    child:
                                                    ValueListenableBuilder<dynamic>(
                                                      valueListenable: result,
                                                      builder: (context, value, _) {
                                                        if (value != null) {
                                                          SchedulerBinding.instance
                                                              .addPostFrameCallback((_) {
                                                            setState(() {
                                                              buttonText = 'Done';
                                                            });
                                                          });
                                                          // buttonText = 'Done';

                                                          // WidgetsFlutterBinding.ensureInitialized();
                                                          return Center(
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 100.h,
                                                                  width: 100.w,
                                                                  child: const CheckMark(
                                                                    active: true,
                                                                    curve:
                                                                    Curves.decelerate,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                        500),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Transaction Successful',
                                                                  style: mediumTitleFont
                                                                      .copyWith(
                                                                    color: context
                                                                        .isDarkMode
                                                                        ? Colors.white
                                                                        : Colors.black,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        } else {
                                                          return const SizedBox.shrink();
                                                        }
                                                        //return Text('${value ?? ''}');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                  onPressed: _tagRead,
                                                  child: Text(buttonText)),
                                            ],
                                          ),
                                        );
                                      });
                                    }).then((value) {
                                  setState(() {
                                    result = ValueNotifier(null);
                                    buttonText = 'Tap Card';
                                  });
                                  Navigator.of(context).pop();
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter an amount'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                          ),
                          //Manual
                          ListTile(
                              leading: Container(
                                  padding: EdgeInsets.all(10.w),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.isDarkMode ? Colors.white : Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(5.h),
                                    color: context.isDarkMode
                                        ? Colors.transparent
                                        : const Color(0xffE4E9EC),
                                  ),
                                  // color: Color(0xffD1E9FF),
                                  child: Icon(
                                    color: context.isDarkMode ? Colors.white : Colors.black,
                                    Icons.add_card,
                                    opticalSize: 24.w,
                                  )),
                              title: const Text('Insert card details'),
                              trailing: const Icon(Icons.chevron_right_sharp),
                              onTap: () {
                                if (true) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => CardPaymentPage(
                                        amount: widget.serviceModel.fees[index].values.first.toDouble(),
                                      ),
                                    ),
                                  );
                                } else {
                                }
                              }),

                        ],
                      ),
                    ),
                  ));
                },
                child: const Text('Pay'),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),

    );
  }




  void _tagRead() {
    if (result.value != null) {
      Navigator.of(context).pop();
    } else {
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        setState(() {
          result.value = tag.data;
          buttonText = 'Done';
        });

        NfcManager.instance.stopSession();
      });
    }
  }
}
