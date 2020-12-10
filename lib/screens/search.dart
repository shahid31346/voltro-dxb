import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:voltro_dxb/Servicess/backend_services.dart';
import 'package:voltro_dxb/models/country_model.dart';
import 'package:voltro_dxb/utils/constants.dart';
import 'package:voltro_dxb/widgets/country_single.dart';
import 'package:voltro_dxb/widgets/loader.dart';

class Search extends StatefulWidget {
  Search({
    Key key,
  }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search>
    with AutomaticKeepAliveClientMixin<Search> {
  // int _counter = 0;
  final TextEditingController _typeAheadController = TextEditingController();
  static List<Country> _det = [];

  static List<Country> getSuggestions(String query) {
    List<Country> matches = [];

    matches.addAll(_det);
    matches.retainWhere(
        (Country s) => s.country.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _det = BackendService.det;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Constants.primaryColor,
      ),
      body: FutureBuilder(
          future: BackendService.getCountries(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Center(
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
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 40.0),
                child: ListTile(
                  title: TypeAheadField(
                      hideSuggestionsOnKeyboardHide: false,
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                            labelText: 'Search here',
                            border: OutlineInputBorder()),
                        controller: this._typeAheadController,
                      ),
                      suggestionsCallback: (pattern) async {
                        return await getSuggestions(pattern);
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return _typeAheadController.text.length == null ||
                                _typeAheadController.text.length == 0
                            ? null
                            : suggestionsBox;
                      },
                      itemBuilder: (context, Country suggestion) {
                        return CountrySingle(
                          name: suggestion.country,
                          totalConfirmed: suggestion.totalConfirmed,
                          totalDeaths: suggestion.totalDeaths,
                          newCases: suggestion.newConfirmed,
                          newDeaths: suggestion.newDeaths,
                          newRecovered: suggestion.newRecovered,
                          totalRecovered: suggestion.totalRecovered,
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        this._typeAheadController.text = suggestion;
                      }),
                ),
              );
            }
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
