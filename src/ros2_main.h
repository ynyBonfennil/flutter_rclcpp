#pragma once

#ifdef __cplusplus
extern "C"
{
#endif

#include "dart_bindings/std_msgs/msg/string.h"

void Ros2Init();
void Ros2CreateNode(char *);
void Ros2SpinSome();

void SubscribeSub(void (*)(const dart_std_msgs_msg_string));
void UnsubscribeSub();

void CreatePublisherPub();
void PublishPub(const dart_std_msgs_msg_string);
void RemovePublisherPub();

#ifdef __cplusplus
}
#endif
