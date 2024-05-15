import 'package:coffe_shop/src/features/map/bloc/address/address_bloc.dart';
import 'package:coffe_shop/src/features/map/bloc/map/map_bloc.dart';
import 'package:coffe_shop/src/features/map/modeles/dto/map_point_dto.dart';
import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PointBottomSheet extends StatelessWidget {
  const PointBottomSheet(
      {super.key, required this.point, required this.mapBloc});

  final MapBloc mapBloc;
  final MapPointDto point;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(point.address,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  GetIt.I<AddressBloc>().add(SetPointEvent(pointDto: point));
                  GetIt.I<AddressBloc>().add(CheckAddressEvent());

                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.sizeOf(context).width, 55),
                  backgroundColor: AppColors.primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                child: Text(
                  'Выбрать',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ]),
      ),
    );
  }
}
