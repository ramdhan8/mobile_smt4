import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/product_remote_datasource.dart';
import '../../../../data/models/responses/product_response_model.dart';


part 'fashion_event.dart';
part 'fashion_state.dart';
part 'fashion_bloc.freezed.dart';

class FashionBloc extends Bloc<FashionEvent, FashionState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  FashionBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<FashionEvent>((event, emit) async {
      emit(const FashionState.loading());
      final response = await _productRemoteDatasource.getProductByCategory(3);
      response.fold(
        (l) =>
            emit(const FashionState.error('Internal Server Error')),
        (r) => emit(FashionState.loaded(r.data!.data!)),
      );
    });
  }
}
