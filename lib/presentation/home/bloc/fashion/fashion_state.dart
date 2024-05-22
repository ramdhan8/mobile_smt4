part of 'fashion_bloc.dart';

@freezed
class FashionState with _$FashionState {
  const factory FashionState.initial() = _Initial;
  const factory FashionState.loading() = _Loading;
  const factory FashionState.loaded(List<Product> products) = _Loaded;
  const factory FashionState.error(String message) = _Error;
}
