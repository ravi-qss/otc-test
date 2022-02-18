import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otc_test/cubits/connection/connection_state.dart';
import 'package:otc_test/pages/dashboard.dart';

import 'cubits/advert_list/advert_list_cubit.dart';
import 'cubits/connection/connection_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ConnectionCubit _connectionCubit;

  @override
  void initState() {
    super.initState();
    _connectionCubit = ConnectionCubit();
  }

  @override
  void dispose() {
    _connectionCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectionCubit>.value(
          value: _connectionCubit,
        ),
        BlocProvider<AdvertListCubit>.value(
          value: AdvertListCubit(connectionCubit: _connectionCubit),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<ConnectionCubit, ConnectionsState>(
            builder: (context, state) {
          if (state is ConnectedState) {
            return const DashboardPage();
          } else if (state is InitialConnectionState ||
              state is ConnectingState) {
            return _buildCenterText('Connecting...');
          } else if (state is ConnectionErrorState) {
            return _buildCenterText('Connection Error\n${state.error}');
          } else if (state is DisConnectedState) {
            return _buildCenterText(
              'Connection is down, trying to reconnect...',
            );
          }
          return Container();
        }),
      ),
    );
  }

  Widget _buildCenterText(String text) => Center(
        child: Text(text),
      );
}
