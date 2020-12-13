/// @description Animation
// Inherit the parent event
event_inherited();

var _time = frac(current_time / 2000 );

bodyX = animcurve_channel_evaluate(bodyChannel, _time);
bodyY = sin(current_time / 318.3 * 2)+1;
headY = sin(current_time / 318.3 * 3);