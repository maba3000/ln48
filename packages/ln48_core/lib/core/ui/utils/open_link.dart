export 'open_link_stub.dart'
    if (dart.library.html) 'open_link_web.dart'
    if (dart.library.io) 'open_link_io.dart';
