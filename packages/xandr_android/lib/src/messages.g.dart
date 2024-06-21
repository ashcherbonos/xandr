// Autogenerated from Pigeon (v20.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse(
    {Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

enum HostAPIUserIdSource {
  criteo,
  theTradeDesk,
  netId,
  liveramp,
  uid2,
}

class HostAPIUserId {
  HostAPIUserId({
    required this.source,
    required this.userId,
  });

  HostAPIUserIdSource source;

  String userId;

  Object encode() {
    return <Object?>[
      source,
      userId,
    ];
  }

  static HostAPIUserId decode(Object result) {
    result as List<Object?>;
    return HostAPIUserId(
      source: result[0]! as HostAPIUserIdSource,
      userId: result[1]! as String,
    );
  }
}

class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is HostAPIUserId) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is HostAPIUserIdSource) {
      buffer.putUint8(130);
      writeValue(buffer, value.index);
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129:
        return HostAPIUserId.decode(readValue(buffer)!);
      case 130:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : HostAPIUserIdSource.values[value];
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class XandrHostApi {
  /// Constructor for [XandrHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  XandrHostApi(
      {BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : __pigeon_binaryMessenger = binaryMessenger,
        __pigeon_messageChannelSuffix =
            messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String __pigeon_messageChannelSuffix;

  Future<bool> init({required int memberId, int? publisherId}) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.init$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList = await __pigeon_channel
        .send(<Object?>[memberId, publisherId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as bool?)!;
    }
  }

  Future<bool> loadAd({required int widgetId}) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.loadAd$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[widgetId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as bool?)!;
    }
  }

  Future<bool> loadInterstitialAd({
    required int widgetId,
    String? placementID,
    String? inventoryCode,
    Map<String?, List<String?>?>? customKeywords,
  }) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.loadInterstitialAd$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList = await __pigeon_channel.send(
            <Object?>[widgetId, placementID, inventoryCode, customKeywords])
        as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as bool?)!;
    }
  }

  Future<bool> showInterstitialAd({int? autoDismissDelay}) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.showInterstitialAd$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList = await __pigeon_channel
        .send(<Object?>[autoDismissDelay]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as bool?)!;
    }
  }

  Future<void> setPublisherUserId(String publisherUserId) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.setPublisherUserId$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList = await __pigeon_channel
        .send(<Object?>[publisherUserId]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<String> getPublisherUserId() async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.getPublisherUserId$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as String?)!;
    }
  }

  Future<void> setUserIds(List<HostAPIUserId?> userIds) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.setUserIds$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[userIds]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<List<HostAPIUserId?>> getUserIds() async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.getUserIds$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as List<Object?>?)!.cast<HostAPIUserId?>();
    }
  }

  Future<String> initMultiAdRequest() async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.initMultiAdRequest$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as String?)!;
    }
  }

  Future<void> disposeMultiAdRequest(String multiAdRequestID) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.disposeMultiAdRequest$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList = await __pigeon_channel
        .send(<Object?>[multiAdRequestID]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool> loadAdsForMultiAdRequest(String multiAdRequestID) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.loadAdsForMultiAdRequest$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList = await __pigeon_channel
        .send(<Object?>[multiAdRequestID]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as bool?)!;
    }
  }

  Future<void> setGDPRConsentRequired(bool isConsentRequired) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.setGDPRConsentRequired$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList = await __pigeon_channel
        .send(<Object?>[isConsentRequired]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setGDPRConsentString(String consentString) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.setGDPRConsentString$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[consentString]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setGDPRPurposeConsents(String purposeConsents) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.xandr_android.XandrHostApi.setGDPRPurposeConsents$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList = await __pigeon_channel
        .send(<Object?>[purposeConsents]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }
}

abstract class XandrFlutterApi {
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  void onAdLoaded(int viewId, int width, int height, String creativeId,
      String adType, String tagId, String auctionId, double cpm, int memberId);

  void onAdLoadedError(int viewId, String reason);

  void onNativeAdLoaded(
      int viewId, String title, String description, String imageUrl);

  void onNativeAdLoadedError(int viewId, String reason);

  static void setUp(
    XandrFlutterApi? api, {
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) {
    messageChannelSuffix =
        messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoaded$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoaded was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_viewId = (args[0] as int?);
          assert(arg_viewId != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoaded was null, expected non-null int.');
          final int? arg_width = (args[1] as int?);
          assert(arg_width != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoaded was null, expected non-null int.');
          final int? arg_height = (args[2] as int?);
          assert(arg_height != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoaded was null, expected non-null int.');
          final String? arg_creativeId = (args[3] as String?);
          assert(arg_creativeId != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoaded was null, expected non-null String.');
          final String? arg_adType = (args[4] as String?);
          assert(arg_adType != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoaded was null, expected non-null String.');
          final String? arg_tagId = (args[5] as String?);
          assert(arg_tagId != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoaded was null, expected non-null String.');
          final String? arg_auctionId = (args[6] as String?);
          assert(arg_auctionId != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoaded was null, expected non-null String.');
          final double? arg_cpm = (args[7] as double?);
          assert(arg_cpm != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoaded was null, expected non-null double.');
          final int? arg_memberId = (args[8] as int?);
          assert(arg_memberId != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoaded was null, expected non-null int.');
          try {
            api.onAdLoaded(
                arg_viewId!,
                arg_width!,
                arg_height!,
                arg_creativeId!,
                arg_adType!,
                arg_tagId!,
                arg_auctionId!,
                arg_cpm!,
                arg_memberId!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoadedError$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoadedError was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_viewId = (args[0] as int?);
          assert(arg_viewId != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoadedError was null, expected non-null int.');
          final String? arg_reason = (args[1] as String?);
          assert(arg_reason != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onAdLoadedError was null, expected non-null String.');
          try {
            api.onAdLoadedError(arg_viewId!, arg_reason!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.xandr_android.XandrFlutterApi.onNativeAdLoaded$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onNativeAdLoaded was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_viewId = (args[0] as int?);
          assert(arg_viewId != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onNativeAdLoaded was null, expected non-null int.');
          final String? arg_title = (args[1] as String?);
          assert(arg_title != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onNativeAdLoaded was null, expected non-null String.');
          final String? arg_description = (args[2] as String?);
          assert(arg_description != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onNativeAdLoaded was null, expected non-null String.');
          final String? arg_imageUrl = (args[3] as String?);
          assert(arg_imageUrl != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onNativeAdLoaded was null, expected non-null String.');
          try {
            api.onNativeAdLoaded(
                arg_viewId!, arg_title!, arg_description!, arg_imageUrl!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.xandr_android.XandrFlutterApi.onNativeAdLoadedError$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onNativeAdLoadedError was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_viewId = (args[0] as int?);
          assert(arg_viewId != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onNativeAdLoadedError was null, expected non-null int.');
          final String? arg_reason = (args[1] as String?);
          assert(arg_reason != null,
              'Argument for dev.flutter.pigeon.xandr_android.XandrFlutterApi.onNativeAdLoadedError was null, expected non-null String.');
          try {
            api.onNativeAdLoadedError(arg_viewId!, arg_reason!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
