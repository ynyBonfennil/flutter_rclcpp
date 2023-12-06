cmake_minimum_required(VERSION 3.10)
project(flutter_rclcpp_library)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

add_library(flutter_rclcpp SHARED
  "ros2_main.cpp"
  "minimal_pub_sub.cpp"
)
ament_target_dependencies(flutter_rclcpp rclcpp std_msgs)

set_target_properties(flutter_rclcpp PROPERTIES
  PUBLIC_HEADER flutter_rclcpp.h
  OUTPUT_NAME "flutter_rclcpp"
)

target_compile_definitions(flutter_rclcpp PUBLIC DART_SHARED_LIB)
