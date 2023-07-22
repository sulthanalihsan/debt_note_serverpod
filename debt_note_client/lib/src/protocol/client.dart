/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:debt_note_client/src/protocol/tb_debt.dart' as _i3;
import 'dart:io' as _i4;
import 'protocol.dart' as _i5;

class _EndpointDebt extends _i1.EndpointRef {
  _EndpointDebt(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'debt';

  _i2.Future<List<_i3.Debt>> get() => caller.callServerEndpoint<List<_i3.Debt>>(
        'debt',
        'get',
        {},
      );

  _i2.Future<void> create(_i3.Debt row) => caller.callServerEndpoint<void>(
        'debt',
        'create',
        {'row': row},
      );

  _i2.Future<bool> update(_i3.Debt row) => caller.callServerEndpoint<bool>(
        'debt',
        'update',
        {'row': row},
      );

  _i2.Future<int> delete(int debtId) => caller.callServerEndpoint<int>(
        'debt',
        'delete',
        {'debtId': debtId},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i4.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i5.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    debt = _EndpointDebt(this);
    example = _EndpointExample(this);
  }

  late final _EndpointDebt debt;

  late final _EndpointExample example;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'debt': debt,
        'example': example,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
