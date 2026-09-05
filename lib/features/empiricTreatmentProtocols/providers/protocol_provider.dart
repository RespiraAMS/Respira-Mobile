import 'package:flutter/material.dart';
import '../models/protocol.dart';
import './protocol_repository.dart';

class ProtocolProvider extends ChangeNotifier {
  final ProtocolRepository _repository;

  ProtocolProvider(this._repository);

  Future<ProtocolDetail> fetchProtocolDetail(String id) {
    return _repository.fetchProtocolDetail(id);
  }
}