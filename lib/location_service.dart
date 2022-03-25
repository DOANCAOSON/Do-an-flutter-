import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class LocationService {
  final String key = 'AIzaSyD3sTIBc6KkUfTvSnSsSmMBrd75Uv0TnAw';

  Future<String> getPlaceId(String input) async {
    final String url ='https://map.googleapis.com/map/api/place/findplacefromtext/jons?input=$input&inputtype=textquery&key=$key';

    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);

    var placeId  = json['candidate'] [0] ['place_id'] as String;
    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId  =  await getPlaceId(input);

    final String url = 'https://map.googleapis.com/map/api/place/details/jons?place_id=$placeId&key=$key';
    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);
    var results = json ['result'] as Map<String, dynamic>;

    print(results);
    return results;
  }
}