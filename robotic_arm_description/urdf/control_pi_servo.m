rosinit
%% 
% while true
    j1 = rossubscriber('j1');
    j11 = receive(j1);
    disp(j11);
    j2 = rossubscriber('j2');
    j12 = receive(j2);
    disp(j12);
    j3 = rossubscriber('j3');
    j13 = receive(j3);
    disp(j13);
    j4 = rossubscriber('j4');
    j14 = receive(j4);
    disp(j14);
    j5 = rossubscriber('j5');
    j15 = receive(j5);
    disp(j15);
    j6 = rossubscriber('j6');
    j16 = receive(j6);
    disp(j16);
    j7 = rossubscriber('j7');
    j17 = receive(j7);
    disp(j17);
    
    p11 = j11.Data * (180/pi);
    p12 = j12.Data * (180/pi);
    p13 = j13.Data * (180/pi);
    p14 = j14.Data * (180/pi);
    p15 = j15.Data * (180/pi);
    p16 = j16.Data * (180/pi);
    p17 = j17.Data * (180/pi);

    p1 = cast(p11,"double");
    p2 = cast(p12,"double");
    p3 = cast(p13,"double");
    p4 = cast(p14,"double");
    p5 = cast(p15,"double");
    p6 = cast(p16,"double");
    p7 = cast(p17,"double");
    o1 = cast(j11.Data,"double");
%     sim('robotic_arm.slx')
    
% end
%%
r = raspi("192.168.43.130","pi","raspberry");

%%

s1 = servo(r,14);
%%
while true
writePosition(s1,60);
pause(2)
writePosition(s1,130);
pause(2)
end