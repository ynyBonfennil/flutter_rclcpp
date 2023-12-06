#include <memory>
#include <string>
#include <unordered_map>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"

typedef void (* MessageCallback)(const char *);

class MinimalPubSub : public rclcpp::Node
{
private:
  rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription_sub_;
  rclcpp::Publisher<std_msgs::msg::String>::SharedPtr publisher_pub_;

public:
  MinimalPubSub(std::string);
  void SubscribeSub(void (*)(const std_msgs::msg::String &));
  void UnsubscribeSub();

  void CreatePublisherPub();
  void PublishPub(const std_msgs::msg::String &);
  void RemovePublisherPub();
};
