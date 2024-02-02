String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Email is required';
  }
  if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

// TextField(
//   decoration: InputDecoration(
//     labelText: 'Email',
//   ),
//   validator: validateEmail,
// );

