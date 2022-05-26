rosinit
%% 
while true
    jSub_1 = rossubscriber('/robot_controller/command');
    jMsg_1 = receive(jSub_1);
    disp(jMsg_1);



    pos_1 = jMsg_1.Points.Positions;
    
    p11 = pos_1(1) * (180/pi);
    p12 = pos_1(2) * (180/pi);
    p13 = pos_1(3) * (180/pi);
    p14 = pos_1(4) * (180/pi);
    p15 = pos_1(5) * (180/pi);
    p16 = pos_1(6) * (180/pi);
    p17 = pos_1(7) * (180/pi);
    
    class(p11)

    
   sim('robotic_arm.slx')

   disp(pos_1)
end