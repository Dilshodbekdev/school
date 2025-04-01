import 'package:retrofit/retrofit.dart' as retrofit;
import 'package:dio/dio.dart';
import 'package:school/src/core/error/dio_error.dart';
import 'data_state.dart';

mixin BaseRepository {
  Future<DataState<T>> handleResponse<T>({
    required Future<retrofit.HttpResponse<T>> response,
    T Function(T param)? next,
  }) async {
    try {
      final httpResponse = await response;
      return DataSuccess(
          next == null ? httpResponse.data : next((httpResponse.data)));
    } on DioException catch (e) {
      if (e.isNoConnection || e.isBadConnection) {
        const message = 'Internet bilan aloqa yaxshi emas!';
        return const DataFailed(message: message);
      } else if (e.isBadRequest) {
        final message = e.response?.data?['detail'].toString() ?? 'Internet bilan aloqa yaxshi emas!';
        return DataFailed(message: message);
      } else {
        const message = 'Xatolik yuz berdi!';
        return const DataFailed(message: message);
      }
    }
  }
}
