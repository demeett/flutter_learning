// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_view_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageUploadViewModel on _ImageUploadViewModelBase, Store {
  late final _$fileAtom =
      Atom(name: '_ImageUploadViewModelBase.file', context: context);

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ImageUploadViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_ImageUploadViewModelBaseActionController =
      ActionController(name: '_ImageUploadViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_ImageUploadViewModelBaseActionController
        .startAction(name: '_ImageUploadViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ImageUploadViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveLocalFile(XFile? file) {
    final _$actionInfo = _$_ImageUploadViewModelBaseActionController
        .startAction(name: '_ImageUploadViewModelBase.saveLocalFile');
    try {
      return super.saveLocalFile(file);
    } finally {
      _$_ImageUploadViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
file: ${file},
isLoading: ${isLoading}
    ''';
  }
}
