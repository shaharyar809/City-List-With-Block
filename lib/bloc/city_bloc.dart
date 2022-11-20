import 'package:city_list/model/city.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/get_city_list.dart';

class CityBloc extends Bloc<CityEvent, CitySate> {
  final GetCityList _getCityList = GetCityList();
  CityBloc() : super(CityLoading()) {
    on<CityLoad>((event, emit) async {
      emit(CityLoading());
      try {
        final List<City> cityList = await _getCityList.callAPI();
        emit(CityLoaded(cityList));
      } catch (e) {
        emit(CityError(e.toString()));
      }
    });
  }
}

@immutable
abstract class CityEvent extends Equatable {
  const CityEvent();
}

class CityLoad extends CityEvent {
  @override
  List<Object?> get props => [];
}

@immutable
abstract class CitySate extends Equatable {}

class CityLoading extends CitySate {
  @override
  List<Object?> get props => [];
}

class CityLoaded extends CitySate {
  final List<City> cityList;

  CityLoaded(this.cityList);

  @override
  List<Object?> get props => [cityList];
}

class CityError extends CitySate {
  final String error;

  CityError(this.error);

  @override
  List<Object?> get props => [error];
}
