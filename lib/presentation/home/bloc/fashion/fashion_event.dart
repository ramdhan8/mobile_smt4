part of 'fashion_bloc.dart';

@freezed
class FashionEvent with _$FashionEvent {
  const factory FashionEvent.started() = _Started;
  const factory FashionEvent.getFashion() = _getFashion;
}