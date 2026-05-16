function is_blank_data(_data) {
   return _data == BLANK_DATA;
}

function deep_copy_array(src) {
   var dst = [];
   for (var i = 0; i < array_length(src); i++) {
       if (is_array(src[i])) {
           dst[i] = deep_copy_array(src[i]); // Recursively copy sub-arrays
       } else {
           dst[i] = src[i];
       }
   }
   return dst;
}