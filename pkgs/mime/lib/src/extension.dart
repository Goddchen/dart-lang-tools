// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'default_extension_map.dart';

/// Reverse map of [defaultExtensionMap] with overrides for common extensions
/// since different extensions may map to the same MIME type.
final Map<String, String> _defaultMimeTypeMap = {
  for (var entry in defaultExtensionMap.entries) entry.value: entry.key,
}..addAll({
    'application/vnd.ms-excel': 'xls',
    'application/vnd.ms-powerpoint': 'ppt',
    'image/jpeg': 'jpg',
    'image/tiff': 'tif',
    'image/svg+xml': 'svg',
    'text/calendar': 'ics',
    'text/javascript': 'js',
    'text/plain': 'txt',
    'text/sgml': 'sgml',
    'text/x-pascal': 'pas',
    'video/mp4': 'mp4',
    'video/mpeg': 'mpg',
    'video/quicktime': 'mov',
    'video/x-matroska': 'mkv',
  });

/// The file extension for a given MIME type.
///
/// If there are multiple extensions for [mimeType], return preferred extension
/// if defined in [_defaultMimeTypeMap], otherwise an extension chosen by the
/// library.
///
/// If no extension is found, `null` is returned.
String? extensionFromMime(String mimeType) =>
    _defaultMimeTypeMap[mimeType.toLowerCase()];
