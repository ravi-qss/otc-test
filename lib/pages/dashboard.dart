import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otc_test/cubits/advert_list/advert_list_cubit.dart';
import 'package:otc_test/cubits/advert_list/advert_list_state.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late int page = 1;
  late ScrollController _controller;
  final GlobalKey _menuKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    BlocProvider.of<AdvertListCubit>(context).authorizeAndFetchAdvertList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P2P Test App'),
        actions: [
          _getPopUpMenuButton(),
        ],
      ),
      body: BlocBuilder<AdvertListCubit, AdvertListState>(
          builder: (context, AdvertListState state) {
        if (state is AdvertListInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AdvertListErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is AdvertListLoadedState) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.list.length,
                  controller: _controller,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    var advert = state.list[position];
                    return Container(
                      color: Colors.black12,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text('Name : '),
                              Text('${advert.advertiserDetails?.name}'),
                            ],
                          ),
                          Wrap(
                            children: [
                              const Text('Description : '),
                              Text('${advert.description}'),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Account Currency : '),
                              Text('${advert.accountCurrency}'),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              state.isLoading ? const CircularProgressIndicator() : Container(),
            ],
          );
        }
        return Container();
      }),
    );
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      BlocProvider.of<AdvertListCubit>(context).fetchNextPage();
    }
  }

  Widget _getPopUpMenuButton() {
    return PopupMenuButton(
        key: _menuKey,
        itemBuilder: (_) => const <PopupMenuItem<String>>[
              PopupMenuItem<String>(child: Text('Completion'), value: 'completion'),
          PopupMenuItem<String>(child: Text('Rate'), value: 'rate'),
            ],
        onSelected: (String value) {
          BlocProvider.of<AdvertListCubit>(context).sortAdvertListBy(value);
        });
  }
}
