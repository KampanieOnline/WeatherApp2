import 'dart:convert';
import 'dart:typed_data';
import 'package:chopper/chopper.dart';
import 'package:weather_app/common/models/type_converter_exception.dart';

class JsonToTypeConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  JsonToTypeConverter(this.typeToJsonFactoryMap);

  @override
  Response convertError<BodyType, InnerType>(Response response) {
    final jsonResponse = super.convertError(response);
    return convertModel<BodyType, InnerType>(jsonResponse, response);
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return convertModel<BodyType, InnerType>(response, response);
  }

  Response<BodyType> convertModel<BodyType, InnerType>(
      Response response, Response bodyResponse) {
    final functionFromType = typeToJsonFactoryMap[InnerType];
    if (functionFromType == null)
      throw TypeConverterException(
          "Cannot map the type $InnerType to the function. Did you miss about adding a model to Chopper's converter?");
    return response.copyWith(
        body: fromJsonData<BodyType, InnerType>(
            bodyResponse.bodyBytes, functionFromType));
  }

  T fromJsonData<T, InnerType>(Uint8List jsonData, Function jsonParser) {
    if (jsonData.isEmpty) return jsonParser(<String, dynamic>{});

    final jsonMap = json.decode(utf8.decode(jsonData));
    if (jsonMap is List) {
      return jsonMap
          .map((item) => jsonParser(item as Map<String, dynamic>) as InnerType)
          .toList() as T;
    }
    return jsonMap;
  }
}
