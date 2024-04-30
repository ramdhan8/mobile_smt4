
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:projek/data/models/responses/city_response_model.dart';
import 'package:projek/data/models/responses/subdistrict_response_model.dart';
import '../../core/constants/variables.dart';
import '../models/responses/province_response_model.dart';

class RajaongkirRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvinces() async {
    final url = Uri.parse('https://api.rajaongkir.com/starter/province');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  //city by province
  Future<Either<String, CityResponseModel>> getCitiesByProvince(
      String provinceId) async {
    final url =
        Uri.parse('https://api.rajaongkir.com/starter/city');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return right(CityResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  //district by city
  Future<Either<String, SubdistrictResponseModel>> getSubdistrictsByCity(
      String cityId) async {
    final url =
        Uri.parse('https://api.rajaongkir.com/starter/cost');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return right(SubdistrictResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }
}
