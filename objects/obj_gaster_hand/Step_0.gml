switch(state)
{
    case 0:
        dir += pi/60;
        
        x += cos(dir)/2;
        y += sin(dir)/2;
        break;
    case 1:
        x = lerp(startX, endX, timer/travelTime);
        y = lerp(startY, endY, timer/travelTime);
        
        if(abs(x-endX) < 3 && abs(y-endY) < 3) state = endState;
        
        timer++;
        break;
}