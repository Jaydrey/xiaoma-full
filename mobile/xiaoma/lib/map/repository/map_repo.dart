import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:xiaoma/app/settings/api_settings.dart';
import 'package:xiaoma/map/models/models.dart';
import 'package:xiaoma/utils/loggings.dart';

class MapsRepo {
  MapsRepo();

  Future<List<PlaceModel>?> getPlacesAutoComplete({
    required String query,
  }) async {
    final dio = Dio();
    final params = {
      "input": query,
      "key": dotenv.env["XIAOMA_GOOGLE_API_KEY"],
      "components": "country:ke",
    };
    const endpoint =
        "${ApiSettings.autocompletionBase}/${ApiSettings.autocompletionPath}";
    XiamaLogger.debugPrint(endpoint);
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: params,
      );
      final predictions = response.data["predictions"] as List;
      final places = predictions.map((place) {
        final placeMap = place as Map;
        return PlaceModel(
          placeId: placeMap["place_id"],
          reference: placeMap["reference"],
          description: placeMap["description"],
        );
      }).toList();
      XiamaLogger.debugPrint("${response.data}");
      XiamaLogger.debugPrint("$places");
      XiamaLogger.debugPrint("places ${places.length}");
      return places;
    } catch (e) {
      XiamaLogger.debugPrint("An error occurred $e");
    }
    return null;
  }
}
