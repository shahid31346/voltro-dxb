import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voltro_dxb/Servicess/backend_services.dart';
import 'package:voltro_dxb/models/country_model.dart';
import 'package:voltro_dxb/utils/constants.dart';
import 'package:voltro_dxb/widgets/country_single.dart';
import 'package:voltro_dxb/widgets/loader.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  bool loading = false;
  bool responseCode = false;
  static bool apiCalled = false;
  String world = '0';

  Future<List<Country>> _myList;

  messageAllert(String msg, String ttl) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(ttl),
            ),
            content: Text(msg),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: false,
                child: Column(
                  children: <Widget>[
                    Text('Okay'),
                  ],
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                ),
              ),
            ],
          );
        });
  }

  messageAllertExit(String msg, String ttl) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(ttl),
            ),
            content: Text(msg),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: false,
                child: Column(
                  children: <Widget>[
                    Text('yes'),
                  ],
                ),
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
              ),
              CupertinoDialogAction(
                isDefaultAction: false,
                child: Column(
                  children: <Widget>[
                    Text('No'),
                  ],
                ),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ],
          );
        });
  }

  Future<bool> _onBackPressed() {
    return messageAllertExit(
        'You are going to exit the application!!', 'Are you sure?');
  }

  @override
  void initState() {
    super.initState();

    _myList = BackendService.getCountries();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Constants.primaryColor,
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Column(
          children: [
            Container(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('World'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w800)),
                    FutureBuilder(
                        future: BackendService.totalGlobalConfirmed(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data.toString(),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            );
                          }
                          return Text(
                            "0",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          );
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder<List<Country>>(
              future: _myList,
              builder: (_, AsyncSnapshot<List<Country>> snapLs) {
                if (!snapLs.hasData)
                  return Center(
                    child: ColorLoader(
                      colors: [
                        Colors.blueAccent,
                        Colors.orange,
                        Colors.green,
                        Colors.black,
                        Colors.red,
                      ],
                      duration: Duration(milliseconds: 700),
                    ),
                  );

                return ListView.builder(
                  itemCount: snapLs.data.length,
                  itemBuilder: (_, index) {
                    List<Country> bookingss = snapLs.data;
                    Country cont = bookingss[index];

                    return CountrySingle(
                      name: cont.country,
                      totalConfirmed: cont.totalConfirmed,
                      totalDeaths: cont.totalDeaths,
                      newCases: cont.newConfirmed,
                      newDeaths: cont.newDeaths,
                      newRecovered: cont.newRecovered,
                      totalRecovered: cont.totalRecovered,
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
