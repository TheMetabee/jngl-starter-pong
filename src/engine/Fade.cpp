#include "Fade.hpp"

#include <jngl.hpp>

Fade::Fade(std::shared_ptr<Work> work, int speed)
: work_(std::move(work)), oldWork_(jngl::getWork()), fadeCount_(0), speed_(speed) {
}

void Fade::step() {
	const int maxAlpha = 255;
	fadeCount_ += speed_;
	if (fadeCount_ >= 2 * maxAlpha) { // Finished?
		jngl::setWork(work_);
	}
}

void Fade::draw() const {
	const int maxAlpha = 255;
	if (fadeCount_ < maxAlpha) {
		if (!dynamic_cast<Fade*>(oldWork_.get())) {
			oldWork_->draw();
		}
	} else {
		work_->draw();
	}
	const int alpha =
	    static_cast<int>(fadeCount_ > maxAlpha ? 2 * maxAlpha - fadeCount_ : fadeCount_);
	jngl::drawSquare(jngl::modelview().scale(jngl::getScreenSize()),
	                 jngl::Rgba::u8(255, 255, 255, alpha));
}
