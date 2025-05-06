#pragma once

#include <string>

const std::string programDisplayName = "JNGL Pong Game";

constexpr int BALL_RADIUS = 20;


constexpr int PADDLE_W = 50;
constexpr int PADDLE_H = 200;

constexpr int BOUNDS_W = 960;
constexpr int BOUNDS_H = 540;


void printCentered(const std::string& text, double x, double y);
