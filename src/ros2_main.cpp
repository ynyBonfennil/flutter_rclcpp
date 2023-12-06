#include <string>

#include "ros2_main.h"
#include "rclcpp/rclcpp.hpp"

#include "minimal_pub_sub.hpp"

std::shared_ptr<MinimalPubSub> ros2_node;

void ros2_init()
{
  rclcpp::init(0, nullptr);
}

void ros2_create_node(char * name)
{
  ros2_node = std::make_shared<MinimalPubSub>(std::string(name));
}

void ros2_spin_some()
{
  rclcpp::spin_some(ros2_node);
}
