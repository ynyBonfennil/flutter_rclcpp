#pragma once

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdint.h>
#include "multi_array_layout.h"

  typedef struct
  {
    dart_std_msgs_msg_multi_array_layout layout;
    uint8_t *data;
  } dart_std_msgs_msg_uint8_multi_array;

#ifdef __cplusplus
}
#endif
