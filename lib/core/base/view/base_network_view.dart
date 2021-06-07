import 'package:flutter/material.dart';
import 'package:tv_app/core/base/model/resource.dart';

class BaseNetworkView extends StatelessWidget {
  final Status? status;
  final Widget onLoading;
  final Widget onSuccess;
  final Widget onError;
  final Widget onIdle;

  const BaseNetworkView(
      {Key? key,
      required this.status,
      required this.onLoading,
      required this.onError,
      required this.onIdle,
      required this.onSuccess})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage() {
    if (this.status == Status.IDLE) {
      return this.onIdle;
    } else if (this.status == Status.LOADING) {
      return this.onLoading;
    } else if (this.status == Status.SUCCESS) {
      return this.onSuccess;
    } else if (this.status == Status.ERROR) {
      return this.onError;
    }
    return SizedBox.shrink();
  }
}
