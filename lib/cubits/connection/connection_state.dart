import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';

@immutable
abstract class ConnectionsState {}

class InitialConnectionState extends ConnectionsState {

  @override
  String toString() {
    return 'InitialConnectionState{}';
  }
}

  class ConnectingState extends ConnectionsState {
  final BinaryAPI api;

  ConnectingState(this.api);

  @override
  String toString() {
    return 'ConnectingState{}';
  }
}

class ConnectedState extends ConnectionsState {
  final BinaryAPI api;

  ConnectedState(this.api);
  @override
  String toString() {
    return 'ConnectedState{}';
  }
}

class DisConnectedState extends ConnectionsState {

  @override
  String toString() {
    return 'DisConnectedState{}';
  }
}

class ConnectionErrorState extends ConnectionsState {

  final String error;

  ConnectionErrorState(this.error);
  @override
  String toString() {
    return 'DisConnectedState{}';
  }
}

class ReConnectingState extends ConnectionsState {

  @override
  String toString() {
    return 'ReConnectingState{}';
  }
}

