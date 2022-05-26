rosinit
%%

sub = rossubscriber("/joint_states");
msg = receive(sub);
%%
angles = int16(msg.Position(1:7)'.*180/pi);
disp(angles); 
%%

r= raspi("192.168.43.130","pi","raspberry");
%%
s =servo(r,14,'MinPulseDuration',500*10^-6,'MaxPulseDuration',2400*10^-6);
%%
a = servo(r,4,'MinPulseDuration',500*10^-6,'MaxPulseDuration',2400*10^-6);
%%
writePosition(a,180);
%%
 writePosition(s,180);

%%
s1 = servo(r,24,'MinPulseDuration',500*10^-6,'MaxPulseDuration',2400*10^-6);
s2 = servo(r,22,'MinPulseDuration',500*10^-6,'MaxPulseDuration',2400*10^-6);
s3 = servo(r,17,'MinPulseDuration',500*10^-6,'MaxPulseDuration',2400*10^-6);
s4 = servo(r,27,'MinPulseDuration',500*10^-6,'MaxPulseDuration',2400*10^-6);
s5 =servo(r,18,'MinPulseDuration',500*10^-6,'MaxPulseDuration',2400*10^-6);
s6 =servo(r,23,'MinPulseDuration',500*10^-6,'MaxPulseDuration',2400*10^-6);
%%
 writePosition(s5,0);
 %%
 writePosition(s,0);
%%
 writePosition(s4,0);
%%
  writePosition(s3,0);
%%
writePosition(s2,90);
%%
while true
sub = rossubscriber("/joint_states");
msg = receive(sub);
 p1 = msg.Position(1)*180/pi;
 p2 = msg.Position(2)*180/pi;
 p3 = msg.Position(3)*180/pi;
 p4 = msg.Position(4)*180/pi;
 p5 = msg.Position(5)*180/pi;
 p6 = msg.Position(6)*180/pi;
 p7 = msg.Position(7)*180/pi;
%  pause(1.5);
 writePosition(s1,abs(p1));
 writePosition(s2,p2+90);
 writePosition(s3,p3+90);
 writePosition(s4,p4+90);
 writePosition(s5,p5+90);
%  if p6 == 0
%      writePosition(s6,p6+120);
%  
%  else
%      writePosition(s6,p6+60);
%  end
 angles = int16(msg.Position(1:7)'.*180/pi);
disp(angles);
end
%%

% r= raspi("192.168.43.130","pi","raspberry");

%%
% s = servo(r,14,'MinPulseDuration',500*10^-6,'MaxPulseDuration',2400*10^-6);


%%

% writePosition(s,p1);
