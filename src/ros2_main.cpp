#include <string>

#include "ros2_main.h"
#include "rclcpp/rclcpp.hpp"

#include "minimal_pub_sub.hpp"

std::shared_ptr<MinimalPubSub> ros2_node;

void Ros2Init()
{
  rclcpp::init(0, nullptr);
}

void Ros2CreateNode(char * name)
{
  ros2_node = std::make_shared<MinimalPubSub>(std::string(name));
}

void Ros2SpinSome()
{
  rclcpp::spin_some(ros2_node);
}

void (* subscribe_sub_callback)(const dart_std_msgs_msg_string);
void callSubscribeSubCallback(const std_msgs::msg::String & msg)
{
  dart_std_msgs_msg_string dart_msg;
  strcpy(dart_msg.data, msg.data.c_str());
  subscribe_sub_callback(dart_msg);
}

void SubscribeSub(void (* callback)(const dart_std_msgs_msg_string))
{
  if (!ros2_node) {return;}

  subscribe_sub_callback = callback;
  ros2_node->SubscribeSub(callSubscribeSubCallback);
}

void UnsubscribeSub()
{
  if (!ros2_node) {return;}

  subscribe_sub_callback = nullptr;
  ros2_node->UnsubscribeSub();
}

void CreatePublisherPub()
{
  if (!ros2_node) {return;}

  ros2_node->CreatePublisherPub();
}

void PublishPub(const dart_std_msgs_msg_string dart_msg)
{
  if (!ros2_node) {return;}

  std_msgs::msg::String msg;
  msg.data = dart_msg.data;
  ros2_node->PublishPub(msg);
}

void RemovePublisherPub()
{
  if (!ros2_node) {return;}

  ros2_node->RemovePublisherPub();
}
