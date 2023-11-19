#include "minimal_pub_sub.hpp"

MinimalPubSub::MinimalPubSub()
: rclcpp::Node("minimal_pub_sub")
{
  this->publisher_ = this->create_publisher<std_msgs::msg::String>("topic_2", 10);
  this->subscription_ = this->create_subscription<std_msgs::msg::String>(
    "topic",
    10,
    std::bind(&MinimalPubSub::onTopic, this, std::placeholders::_1));
}

void MinimalPubSub::RegisterMessageCallback(MessageCallback callback)
{
  this->message_callback_ = callback;
}

void MinimalPubSub::onTopic(const std_msgs::msg::String & msg)
{
  RCLCPP_INFO(this->get_logger(), "onTopic()");
  this->publisher_->publish(std_msgs::msg::String().set__data("asd"));
  if (this->message_callback_) {
    RCLCPP_INFO(this->get_logger(), "call message callback");
    this->message_callback_(msg.data.c_str());
  }
}
