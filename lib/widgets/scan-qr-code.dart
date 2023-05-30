import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:qr_code_app/helper/helper.dart';
import 'package:http/http.dart' as http;

class ScanQrCode extends StatefulWidget {
  @override
  _ScanQrCodeState createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrCodeValue = "";
  int montant = 0;
  bool showDialogBox = false;
  final formField = GlobalKey<FormState>();
  final montantController = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  Helper helper = Helper();

  @override
  Widget build(BuildContext context) {
    print(montant);
    print(qrCodeValue);
    if (this.qrCodeValue.isNotEmpty) {
      print("************** " + qrCodeValue);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          AwesomeDialog(
                  context: context,
                  animType: AnimType.leftSlide,
                  headerAnimationLoop: false,
                  dialogType: DialogType.warning,
                  showCloseIcon: true,
                  title: 'Attention ',
                  desc: "Vous voulez charger " +
                      montant.toString() +
                      " ce numéro " +
                      qrCodeValue,
                  btnOkOnPress: () async {
                    print("Ana dkhelt a zebi ");

                    // try {
                    //   http.Response response = await helper.envoyerRecharge(
                    //       phoneNumber: qrCodeValue, amount: montant);
                    //   print(response);
                    // } on Exception catch (e) {
                    //   print(e);
                    // }
                    http.Response response = await helper.envoyerRecharge(
                        phoneNumber: "jdjddjk", amount: 12);

                    if (response.statusCode == 200 ||
                        response.statusCode == 201) {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.leftSlide,
                        headerAnimationLoop: false,
                        dialogType: DialogType.warning,
                        showCloseIcon: true,
                        title: 'Attention ',
                      );
                    }
                  },
                  btnOkIcon: Icons.check_circle,
                  onDismissCallback: (type) {
                    debugPrint('Dialog Dissmiss from callback $type');
                  },
                  btnCancelOnPress: () => setState(() {
                        qrCodeValue = "";
                      }),
                  btnCancelText: "Non",
                  btnCancelIcon: Icons.cancel)
              .show();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Recharge',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // Add your notification icon onPressed logic here
            },
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                  key: formField,
                  keyboardType: TextInputType.number,
                  controller: montantController,
                  onChanged: (newValue) {
                    if (newValue != Null && newValue!.isNotEmpty) {
                      setState(() {
                        montant = int.parse(montantController.value.text);
                      });
                    }
                  },
                  decoration: const InputDecoration(
                      labelText: "Montant",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.monetization_on))),
            ),
            // Text(
            //   qrCodeValue,
            //   style: const TextStyle(fontSize: 25, color: Colors.green),
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            Center(
              child: Image.asset(
                "images/qrcode.png",
                height: 400,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,

                // Takes 80% of the screen width
                child: TextButton(
                  onPressed: () {
                    barcodeScanning(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff608EE9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Radius for button borders
                    ),
                  ),
                  child: const Text(
                    'Scanner le code Qr',
                    style: TextStyle(
                      color: Colors.white, // White text color
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future openDailog(BuildContext context) async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(child: Text("Attention")),
            content: const Center(
              child: Text(
                  "etes vous sur d'effectuer une recharge de 500dhs à ce numéro 064407069"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      qrCodeValue = "";
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Oui, je confirme")),
              TextButton(
                  onPressed: () {
                    setState(() {
                      qrCodeValue = "";
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Non"))
            ],
          ));

  //scan barcode asynchronously
  Future barcodeScanning(BuildContext context) async {
    try {
      ScanResult barcode = await BarcodeScanner.scan(options: ScanOptions());
      setState(() {
        this.qrCodeValue = barcode.rawContent;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.qrCodeValue = 'Autorisez l\'utilisation de la caméra ';
        });
      } else {
        setState(() => this.qrCodeValue = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.qrCodeValue = 'Nothing captured.');
    } catch (e) {
      setState(() => this.qrCodeValue = 'Unknown error: $e');
    }
  }
}
