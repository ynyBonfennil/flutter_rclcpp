#pragma once

#ifdef __cplusplus
extern "C"
{
#endif

#include "../../builtin_interfaces/msg/time.h"

typedef struct
{
  dart_builtin_interfaces_msg_time stamp;
  char * frame_id;
} dart_std_msgs_msg_header;

#ifdef __cplusplus
}
#endif
