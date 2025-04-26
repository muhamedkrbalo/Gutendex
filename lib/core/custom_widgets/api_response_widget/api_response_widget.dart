import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gutendex/core/custom_widgets/offline_widget/offline_widget.dart';
import 'package:gutendex/core/enum/cubit_state/cubit_state.dart';
import 'package:gutendex/core/locale/app_locale_key.dart';
import 'package:gutendex/core/network/app_interceptors.dart';
import '../custom_loading/custom_loading.dart';
import '../exception_widget/exception_widget.dart';
import '../no_data_widget/no_data_widget.dart';

class ApiResponseWidget extends StatelessWidget {
  final CubitStatus cubitStatus;
  final Widget child;
  final double loadingSize;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? unauthorizedWidget;
  final Widget? offlineWidget;
  final bool isEmpty;
  final bool initialChild;
  final void Function()? onReload;
  final Axis axis;
  final String? noDataMessage;
  final String? exceptionMessage;
  final Color? loadingColor;
  final bool isOfflineData;
  const ApiResponseWidget({
    super.key,
    required this.cubitStatus,
    required this.child,
    required this.onReload,
    required this.isEmpty,
    this.loadingSize = 35,
    this.loadingWidget,
    this.axis = Axis.vertical,
    this.noDataMessage,
    this.exceptionMessage,
    this.errorWidget,
    this.emptyWidget,
    this.offlineWidget,
    this.loadingColor,
    this.unauthorizedWidget,
    this.initialChild = false,
    this.isOfflineData = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isOfflineData)
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.orange[100],
            child: Row(
              children: [
                const Icon(Icons.wifi_off, size: 20),
                const SizedBox(width: 8),
                Flexible(
                    child: Text(AppLocaleKey.pleaseCheckInternetAndRefresh)),
              ],
            ),
          ),
        Expanded(
          child: _buildContent(context),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (cubitStatus) {
      case CubitStatus.initial:
        return initialChild ? child : const SizedBox();
      case CubitStatus.loading:
        return loadingWidget ?? Center(child: CustomLoading(size: loadingSize));
      case CubitStatus.success:
        return isEmpty
            ? emptyWidget ?? NoDataWidget(message: noDataMessage, axis: axis)
            : child;
      case CubitStatus.failure:
        return AppInterceptors.isInternet == false
            ? offlineWidget ?? OfflineWidget(onReload: onReload, axis: axis)
            : errorWidget ??
                ExceptionWidget(message: exceptionMessage, onReload: onReload);
    }
  }
}
