import 'package:bloc/bloc.dart';
import 'package:bloc_vexena/model/photos_model.dart';
import 'package:bloc_vexena/service/photo_service.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit({required this.photoService}) : super(PhotoInitial());
  final PhotoService photoService;

  bool isLoading = false;

  Future<void> fetchPhotos() async {
    changeLoadingView();
    final data = await photoService.fetchPhotos();
    changeLoadingView();
    if (data != null && data.isNotEmpty) {
      emit(PhotoCompleteState(data));
    } else {
      emit(PhotoErrorState("Error Data"));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(PhotoLoadingState(isLoading));
  }
}

abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoadingState extends PhotoState {
  final bool isLoading;
  PhotoLoadingState(this.isLoading);
}

class PhotoCompleteState extends PhotoState {
  final List<Photos> model;
  PhotoCompleteState(this.model);
}

class PhotoErrorState extends PhotoState {
  final String errorMessage;
  PhotoErrorState(this.errorMessage);
}
