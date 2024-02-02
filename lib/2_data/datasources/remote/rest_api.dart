import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:visitor/2_data/models/request/user_request.dart';
import 'package:visitor/2_data/models/response/default_response.dart';

part 'rest_api.g.dart';

/// 접두사 룰
/// GET -> get
/// POST -> post
/// PUT -> put
/// FETCH -> fetch
/// DELETE -> delete

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/login')
  Future<DefaultResponse> login(@Body() UserRequest userModel);

  @GET('/place/{placeId}')
  Future<DefaultResponse> getPlace(@Path("placeId") String placeId);

  @GET('/place/list')
  Future<DefaultResponse> getPlaceList();

  @GET('/device/{deviceId}')
  Future<DefaultResponse> getDevice(@Path("deviceId") String deviceId);

  @GET('/device/list')
  Future<DefaultResponse> getDeviceList();
}
