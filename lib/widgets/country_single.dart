import 'package:flutter/material.dart';
import 'package:voltro_dxb/screens/country_details.dart';

class CountrySingle extends StatelessWidget {
  final String name;
  final int totalConfirmed;
  final int totalDeaths;
  final int newCases;
  final int newDeaths;
  final int newRecovered;
  final int totalRecovered;

  CountrySingle({
    Key key,
    @required this.name,
    @required this.totalConfirmed,
    @required this.totalDeaths,
    @required this.newCases,
    @required this.newDeaths,
    @required this.newRecovered,
    @required this.totalRecovered,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return CountryDetails(
                name: name,
                totalConfirmed: totalConfirmed,
                totalDeaths: totalDeaths,
                newCases: newCases,
                newDeaths: newDeaths,
                newRecovered: newRecovered,
                totalRecovered: totalRecovered,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: Column(
          children: [
            Divider(
              thickness: 0.7,
              color: Colors.black45,
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "$name",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "$totalConfirmed",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
