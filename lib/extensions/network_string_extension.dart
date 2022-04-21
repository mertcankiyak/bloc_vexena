enum NetworkPath { Photos }

extension NetworkpathExtension on NetworkPath {
  String get rawValue {
    switch (this) {
      case NetworkPath.Photos:
        return "/photos";
    }
  }
}
