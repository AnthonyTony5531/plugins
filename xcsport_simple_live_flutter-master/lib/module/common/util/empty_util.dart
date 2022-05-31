///@autho king
///@date 8/5/21

bool isEmpty(
  dynamic data,
) {
  if (null == data) {
    return true;
  }
  if (data is String) {
    if ('null' == data || 'NULL' == data || 'Null' == data) {
      return true;
    }
    return data.trim().isEmpty;
  }
  try {
    return data.isEmpty ?? false;
  } catch (e) {}
  return false;
}

bool isNotEmpty(dynamic data) {
  return !isEmpty(data);
}
