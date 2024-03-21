part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class ProductsLoadingEvent extends ProductsEvent {}
