#pragma once

#ifdef __cplusplus
extern "C"
{
#endif

#include "multi_array_layout.h"

  typedef struct
  {
    dart_std_msgs_msg_multi_array_layout layout;
    double *data;
  } dart_std_msgs_msg_float64_multi_array;

#ifdef __cplusplus
}
#endif
