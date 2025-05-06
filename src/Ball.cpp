#include "Ball.hpp"
#include "constants.hpp"

Ball::Ball(const jngl::Vec2 position, std::shared_ptr<Paddle> left, std::shared_ptr<Paddle> right) 
	: left(left), right(right) 
{
	this->setPosition(position);
}

bool Ball::step() {
	setPosition(getPosition() + velocity);

	auto position = getPosition();

	 int width = jngl::getScreenWidth() / 2;
	if (position.x + BALL_RADIUS > width || position.x - BALL_RADIUS < -width) {
		velocity.x = velocity.x * -1.0;
	}

	int height = jngl::getScreenHeight() / 2;
	if (position.y + BALL_RADIUS > height || position.y - BALL_RADIUS < -height) {
		velocity.y = velocity.y * -1.0;
	}

	// left paddle
	if (position.x - BALL_RADIUS < left->getPosition().x + PADDLE_W / 2 &&
	    position.y + BALL_RADIUS > left->getPosition().y - PADDLE_H / 2 &&
	    position.y - BALL_RADIUS < left->getPosition().y + PADDLE_H / 2) {
		velocity.x = velocity.x * -1.0;
	}

	// right paddle
	if (position.x + BALL_RADIUS > right->getPosition().x - PADDLE_W / 2 &&
	    position.y + BALL_RADIUS > right->getPosition().y - PADDLE_H / 2 &&
	    position.y - BALL_RADIUS < right->getPosition().y + PADDLE_H / 2) {
		velocity.x = velocity.x * -1.0;
	}

	return true;
}

void Ball::draw() const {
	jngl::drawCircle(jngl::modelview().translate(getPosition()).scale(BALL_RADIUS),
	                 jngl::Rgba(1, 1, 1, 1));
}