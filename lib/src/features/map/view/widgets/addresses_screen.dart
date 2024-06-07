import 'package:coffe_shop/src/features/map/bloc/address/address_bloc.dart';
import 'package:coffe_shop/src/features/map/bloc/map/map_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key, required this.mapBloc});

  final MapBloc mapBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.ourShops,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1.0), child: Divider()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder(
          bloc: mapBloc,
          builder: (context, state) {
            if (state is ProgressMapState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }
            if (state is SuccessfulMapState) {
              return ListView.builder(
                itemCount: state.points.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(state.points[index].address),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () {
                      GetIt.I<AddressBloc>()
                          .add(SetPointEvent(pointDto: state.points[index]));
                      GetIt.I<AddressBloc>().add(CheckAddressEvent());
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
