#pragma once

#ifdef __cplusplus
extern "C"
{
#endif

#if _WIN32
#include <windows.h>
#else
#include <pthread.h>
#include <unistd.h>
#endif

#if _WIN32
#define FFI_PLUGIN_EXPORT __declspec(dllexport)
#else
#define FFI_PLUGIN_EXPORT
#endif

  FFI_PLUGIN_EXPORT void create_node();
  FFI_PLUGIN_EXPORT void spin_some();

  typedef void (*MessageCallback)(const char *);
  FFI_PLUGIN_EXPORT void register_subscription_callback(MessageCallback callback);

#ifdef __cplusplus
}
#endif
