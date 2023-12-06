#include "minimal_pub_sub.hpp"

MinimalPubSub::MinimalPubSub(std::string name)
: rclcpp::Node(name)
{
}

void MinimalPubSub::SubscribeSub(void (* callback)(const std_msgs::msg::String &))
{
  this->subscription_sub_ = this->create_subscription<std_msgs::msg::String>(
    "sub",
    rclcpp::QoS(1).reliable().durability_volatile(),
    callback
  );
}

void MinimalPubSub::UnsubscribeSub()
{
  this->subscription_sub_.reset();
}

void MinimalPubSub::CreatePublisherPub()
{
  this->publisher_pub_ = this->create_publisher<std_msgs::msg::String>(
    "pub",
    rclcpp::QoS(1).reliable().durability_volatile()
  );
}

void MinimalPubSub::PublishPub(const std_msgs::msg::String & msg)
{
  if (this->publisher_pub_) {
    this->publisher_pub_->publish(msg);
  }
}

void MinimalPubSub::RemovePublisherPub()
{
  this->publisher_pub_.reset();
}
