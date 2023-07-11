import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:word_mafia_app/core/constants.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final Widget pageBody;

  const CustomScaffold({Key? key, required this.pageBody}) : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> with WidgetsBindingObserver {
  StreamSubscription? connectivitySubscription;
  ValueNotifier<bool> isNetworkDisabled = ValueNotifier(false);
  bool isDialogShown = false; // Track whether the dialog is shown

  void _checkCurrentNetworkState() {
    Connectivity().checkConnectivity().then((connectivityResult) {
      isNetworkDisabled.value = connectivityResult == ConnectivityResult.none;
    });
  }

  initStateFunc() {
    _checkCurrentNetworkState();

    connectivitySubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        isNetworkDisabled.value = result == ConnectivityResult.none;

        // Dismiss the dialog if network connectivity is restored
        if (!isNetworkDisabled.value && isDialogShown) {
          Navigator.of(context).pop();
          isDialogShown = false;
        }
      });
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    initStateFunc();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      _checkCurrentNetworkState();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          backgroundColor: AppColor.customNavyBlue,
          body: widget.pageBody,
          // body: Column(
          //   children: [
          //     Positioned(
          //       child: Stack(
          //         alignment: Alignment.center,
          //         children: [
          //           Container(
          //             height: MediaQuery.of(context).size.height / 6,
          //             decoration: BoxDecoration(
          //               color: AppColor.customBlueGray,
          //               borderRadius: BorderRadius.vertical(
          //                 bottom: Radius.elliptical(
          //                   MediaQuery.of(context).size.width,
          //                   200.0,
          //                 ),
          //               ),
          //             ),
          //           ),
          //           const Text(
          //             AppText.startingAGame,
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //               fontSize: 32,
          //               color: AppColor.customWhiteText,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     widget.pageBody,
          //   ],
          // ),
        ),
        ValueListenableBuilder(
          valueListenable: isNetworkDisabled,
          builder: (_, bool networkDisabled, __) {
            if (networkDisabled && !isDialogShown) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDisconnectDialog(context);
                isDialogShown = true;
              });
            }
            return Container();
          },
        ),
      ],
    );
  }
}

showDisconnectDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(28),
      ),
    ),
    content: SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width / 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              AppText.notConnectedToTheInternetTitle,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 18,
                color: AppColor.customBlackText,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 6),
          //   child: Text(
          //     AppText.notConnectedToTheInternetDescription,
          //     textAlign: TextAlign.end,
          //     style: TextStyle(
          //       fontSize: 12,
          //       color: AppColor.customGreyText,
          //     ),
          //   ),
          // ),
        ],
      ),
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false, // Disable back button to dismiss dialog
        child: alert,
      );
    },
  );
}
