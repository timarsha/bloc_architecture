import 'package:bloc_architecture/data/extensions.dart';
import 'package:bloc_architecture/screens/home/bloc/home_bloc.dart';
import 'package:bloc_architecture/screens/home/widgets/home_coin_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        HomeBloc bloc = context.read<HomeBloc>();
        switch (state) {
          case HomeInitialState _:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Initial State'),
              ),
            );
          case HomeLoadingState _:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Loading State'),
              ),
              body: Center(
                child: CircularProgressIndicator(
                  color: context.greenColor,
                ),
              ),
            );
          case HomeCoinsLoadedState state:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Coins State'),
              ),
              body: CustomScrollView(
                controller: bloc.scrollController,
                slivers: [
                  CupertinoSliverRefreshControl(
                    onRefresh: () async {
                      bloc.add(HomeRefreshCoinsEvent());
                      await bloc.stream.first;
                    },
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(8),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final coin = state.coins[index];
                          return HomeCoinWidget(coin: coin);
                        },
                        childCount: state.coins.length,
                      ),
                    ),
                  ),
                ],
              ),
            );
          case HomeErrorState _:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Error State'),
              ),
            );
        }
      },
    );
  }
}
