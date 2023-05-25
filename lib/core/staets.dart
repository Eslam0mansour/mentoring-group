abstract class AppState{}
class IntiAppState extends AppState{}
class LoadingState extends AppState{}
class FinalResultState extends AppState{}
class ModelLoadedSTate extends AppState{}
class ClassifyImageState extends AppState{}
class PickedImageState extends AppState{}
class ChangeThemeModeState extends AppState{}
class ClearState extends AppState{}

class SignUpLoadingState extends AppState{}

class SignUpDoneState extends AppState{}

class SignUpErrorState extends AppState{
  final String error;
  SignUpErrorState(this.error);
}
class SignInLoadingState extends AppState{}
class SignInDoneState extends AppState{}
class SignInErrorState extends AppState{
  final String error;
  SignInErrorState(this.error);
}
class SignOutLoadingState extends AppState{}
class SignOutDoneState extends AppState{}
class SignOutErrorState extends AppState{
  final String error;
  SignOutErrorState(this.error);
}
class GetUserDataLoadingState extends AppState{}
class NotHaveCurrentUser extends AppState{}
class GetUserDataDoneState extends AppState{}
class GetUserDataErrorState extends AppState{
  final String error;
  GetUserDataErrorState(this.error);
}
