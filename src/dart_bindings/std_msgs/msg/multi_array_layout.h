#pragma once

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdint.h>
#include "multi_array_dimension.h"

typedef struct
{
  dart_std_msgs_msg_multi_array_dimension * dim;
  uint32_t data_offset;
} dart_std_msgs_msg_multi_array_layout;

#ifdef __cplusplus
}
#endif
