import 'package:flutter/material.dart';
import 'package:tv_app/core/constants/enum/network_state.dart';

class BaseNetworkView extends StatelessWidget {
  final NetworkState? status;
  final Widget onLoading;
  final Widget onSuccess;
  final Widget onError;
  final Widget? onIdle;

  const BaseNetworkView(
      {Key? key,
      required this.status,
      required this.onLoading,
      required this.onError,
      this.onIdle,
      required this.onSuccess})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage() {
    if (this.status == NetworkState.IDLE) {
      return this.onIdle ?? SizedBox.shrink();
    } else if (this.status == NetworkState.LOADING) {
      return this.onLoading;
    } else if (this.status == NetworkState.SUCCESS) {
      return this.onSuccess;
    } else if (this.status == NetworkState.ERROR) {
      return this.onError;
    }
    return SizedBox.shrink();
  }
}
