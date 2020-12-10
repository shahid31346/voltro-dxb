import 'package:flutter/material.dart';
import 'package:voltro_dxb/utils/constants.dart';

class CountryDetails extends StatelessWidget {
  final String name;
  final int totalConfirmed;
  final int totalDeaths;
  final int newCases;
  final int newDeaths;
  final int newRecovered;
  final int totalRecovered;

  const CountryDetails(
      {Key key,
      this.name,
      this.totalConfirmed,
      this.totalDeaths,
      this.newCases,
      this.newDeaths,
      this.newRecovered,
      this.totalRecovered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$name',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Corona Status Overview'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              color: Constants.primaryColor,
            ),
            Positioned(
              top: 35.0,
              left: 0.0,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.white,
                textColor: Constants.primaryColor,
                child: Icon(
                  Icons.arrow_back,
                  size: 15,
                ),
                padding: EdgeInsets.all(6),
                shape: CircleBorder(),
              ),
            )
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.065),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total cases'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '$totalConfirmed',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.055),
                  Text(
                    'New Cases'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '$newCases',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.055),
                  Text(
                    'New recovered'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '$newRecovered',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total deaths'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '$totalDeaths',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.055),
                  Text(
                    'New deaths'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '$newDeaths',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.055),
                  Text(
                    'Total recovered'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '$totalRecovered',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
