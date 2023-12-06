#include "flutter_rclcpp.h"
#include "minimal_pub_sub.hpp"
#include "rclcpp/rclcpp.hpp"

std::shared_ptr<MinimalPubSub> minimal_pub_sub;
MessageCallback g_message_callback = nullptr;

FFI_PLUGIN_EXPORT void create_node()
{
  rclcpp::init(0, nullptr);
  minimal_pub_sub = std::make_shared<MinimalPubSub>();
}

FFI_PLUGIN_EXPORT void spin_some()
{
  rclcpp::spin_some(minimal_pub_sub);
}

FFI_PLUGIN_EXPORT void register_subscription_callback(MessageCallback callback)
{
  minimal_pub_sub->RegisterMessageCallback(callback);
}
