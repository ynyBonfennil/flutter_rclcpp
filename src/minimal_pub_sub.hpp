#include <memory>
#include <string>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"

typedef void (* MessageCallback)(const char *);

class MinimalPubSub : public rclcpp::Node
{
private:
  rclcpp::Publisher<std_msgs::msg::String>::SharedPtr publisher_;
  rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription_;

  MessageCallback message_callback_ = nullptr;

public:
  MinimalPubSub(std::string);
  void RegisterMessageCallback(MessageCallback callback);

private:
  void onTopic(const std_msgs::msg::String &);
};
