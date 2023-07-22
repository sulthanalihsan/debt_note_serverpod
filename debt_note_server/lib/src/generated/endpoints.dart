/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/debt_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import 'package:debt_note_server/src/generated/tb_debt.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'debt': _i2.DebtEndpoint()
        ..initialize(
          server,
          'debt',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
    };
    connectors['debt'] = _i1.EndpointConnector(
      name: 'debt',
      endpoint: endpoints['debt']!,
      methodConnectors: {
        'get': _i1.MethodConnector(
          name: 'get',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['debt'] as _i2.DebtEndpoint).get(session),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'row': _i1.ParameterDescription(
              name: 'row',
              type: _i1.getType<_i4.Debt>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['debt'] as _i2.DebtEndpoint).create(
            session,
            params['row'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'row': _i1.ParameterDescription(
              name: 'row',
              type: _i1.getType<_i4.Debt>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['debt'] as _i2.DebtEndpoint).update(
            session,
            params['row'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'debtId': _i1.ParameterDescription(
              name: 'debtId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['debt'] as _i2.DebtEndpoint).delete(
            session,
            params['debtId'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}
