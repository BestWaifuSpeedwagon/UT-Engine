dir = 0;
state = 0;

startX = x;
startY = y;
endX = x;
endY = y;

endState = 0;

travelTime = 0;
timer = 0;

/// @param {real} _x
/// @param {real} _y
/// @param {real} _travelTime
/// @param {int} _endState
/// @returns {void}
function go(_x, _y, _travelTime, _endState)
{
    startX = x;
    startY = y;
    endX = _x;
    endY = _y;
    
    endState = _endState;
    
    travelTime = _travelTime;
    timer = 0;
    
    state = 1;
}