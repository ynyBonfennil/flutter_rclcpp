#pragma once

#ifdef __cplusplus
extern "C"
{
#endif

void rcl_init();
void rcl_spin_some();

void create_node();
void spin_some();

typedef void (* MessageCallback)(const char *);
void register_subscription_callback(MessageCallback callback);

#ifdef __cplusplus
}
#endif
