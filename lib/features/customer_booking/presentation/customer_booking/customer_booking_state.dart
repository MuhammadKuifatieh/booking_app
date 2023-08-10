part of 'customer_booking_bloc.dart';

enum GetCustomerCarOfficeStatus { init, loading, succ, faild }

enum GetCustomerClinicStatus { init, loading, succ, faild }

enum GetCustomerRestaurantStatus { init, loading, succ, faild }

enum GetCustomerHotelStatus { init, loading, succ, faild }

class CustomerBookingState {
  final List<CustomerRestaurantBookingModel> restaurants;
  final List<CustomerHotelBookingModel> hotels;
  final List<CusomerClinicBookingModel> clinics;
  final List<CustomerCarBookingModel> carOffices;
  final GetCustomerCarOfficeStatus getCustomerCarOfficeStatus;
  final GetCustomerClinicStatus getCustomerClinicStatus;
  final GetCustomerRestaurantStatus getCustomerRestaurantStatus;
  final GetCustomerHotelStatus getCustomerHotelStatus;

  CustomerBookingState({
    this.restaurants = const [],
    this.hotels = const [],
    this.clinics = const [],
    this.carOffices = const [],
    this.getCustomerCarOfficeStatus = GetCustomerCarOfficeStatus.init,
    this.getCustomerClinicStatus = GetCustomerClinicStatus.init,
    this.getCustomerRestaurantStatus = GetCustomerRestaurantStatus.init,
    this.getCustomerHotelStatus = GetCustomerHotelStatus.init,
  });

  CustomerBookingState copyWith({
    List<CustomerRestaurantBookingModel>? restaurants,
    List<CustomerHotelBookingModel>? hotels,
    List<CusomerClinicBookingModel>? clinics,
    List<CustomerCarBookingModel>? carOffices,
    GetCustomerCarOfficeStatus? getCustomerCarOfficeStatus,
    GetCustomerClinicStatus? getCustomerClinicStatus,
    GetCustomerRestaurantStatus? getCustomerRestaurantStatus,
    GetCustomerHotelStatus? getCustomerHotelStatus,
  }) {
    return CustomerBookingState(
      restaurants: restaurants ?? this.restaurants,
      hotels: hotels ?? this.hotels,
      clinics: clinics ?? this.clinics,
      carOffices: carOffices ?? this.carOffices,
      getCustomerCarOfficeStatus:
          getCustomerCarOfficeStatus ?? this.getCustomerCarOfficeStatus,
      getCustomerClinicStatus:
          getCustomerClinicStatus ?? this.getCustomerClinicStatus,
      getCustomerRestaurantStatus:
          getCustomerRestaurantStatus ?? this.getCustomerRestaurantStatus,
      getCustomerHotelStatus:
          getCustomerHotelStatus ?? this.getCustomerHotelStatus,
    );
  }
}
