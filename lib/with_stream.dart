import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class UsingStream extends StatefulWidget {
  const UsingStream({Key? key}) : super(key: key);
  @override
  State<UsingStream> createState() => _UsingStreamState();
}

class _UsingStreamState extends State<UsingStream> {
  Connectivity connectivity = Connectivity();
  String connectivityCheck(ConnectivityResult? result) {
    if (result == ConnectivityResult.wifi) {
      return "You are now connected to wifi";
    } else if (result == ConnectivityResult.mobile) {
      return "You are now connected to mobile data";
    } else if (result == ConnectivityResult.ethernet) {
      return "You are now connected to ethernet";
    } else if (result == ConnectivityResult.bluetooth) {
      return "You are now connected to bluetooth";
    } else if (result == ConnectivityResult.none) {
      return "No connection available";
    } else {
      return "No Connection!!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<ConnectivityResult>(
          stream: connectivity.onConnectivityChanged,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: snapshot.data == ConnectivityResult.none
                    ? Colors.red
                    : Colors.green,
                title: const Text("Connectivity check"),
              ),
              body: Center(
                child: Text(connectivityCheck(snapshot.data)),
              ),
            );
          }),
    );
  }
}
