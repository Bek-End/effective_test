abstract class LocalRepo {
  Future<bool> checkAuth();
  Future<void> setAuth();
  // Future<List<ProfileEntity>> getFavoriteProfiles();
  // Future<void> addFavoriteProfile(ProfileEntity profileEntity);
  // Future<void> editFavoriteProfile(ProfileEntity newProfileEntity);
  Future<void> removeFavoriteProfile(String id);
}
