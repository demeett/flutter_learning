// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_learning/404/bloc/login/model/login_model.dart';

import '../../../../product/model/token_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final LoginModel? model;
  final TokenModel? tokenModel;
  final bool isCompleted;

  const LoginState({this.tokenModel, this.isCompleted = false, this.isLoading = false, this.model});
  @override
  List<Object?> get props => [isLoading, model];

  LoginState copyWith({bool? isLoading, LoginModel? model, TokenModel? tokenModel, bool? isCompleted}) {
    return LoginState(
        isLoading: isLoading ?? this.isLoading,
        model: model ?? this.model,
        tokenModel: tokenModel ?? this.tokenModel,
        isCompleted: isCompleted ?? this.isCompleted);
  }
}
