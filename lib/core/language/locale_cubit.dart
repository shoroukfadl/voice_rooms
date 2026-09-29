import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(this._box)
      : super(Locale(_box.get('locale', defaultValue: 'en') as String));

  final Box _box;

  Future<void> setLocale(String code) async {
    await _box.put('locale', code);
    emit(Locale(code));
  }
}
