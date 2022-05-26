#!/usr/bin/env python3
import rospy
from std_msgs.msg import Float32
from sensor_msgs.msg import JointState
from control_msgs.msg import FollowJointTrajectoryActionResult

def callback(data):
    rospy.Subscriber("joint_states", JointState, callback_pos)

def callback_pos(data):
    print ("positions_node is active")
    p1 = data.position[0]
    p2 = data.position[1]
    p3 = data.position[2]
    p4 = data.position[3]
    p5 = data.position[4]
    p6 = data.position[5]
    p7 = data.position[6]
    
    
    j1 = rospy.Publisher("j1",Float32,queue_size=10)
    j2 = rospy.Publisher("j2",Float32,queue_size=10)
    j3 = rospy.Publisher("j3",Float32,queue_size=10)
    j4 = rospy.Publisher("j4",Float32,queue_size=10)
    j5 = rospy.Publisher("j5",Float32,queue_size=10)
    j6 = rospy.Publisher("j6",Float32,queue_size=10)
    j7 = rospy.Publisher("j7",Float32,queue_size=10)
    rate = rospy.Rate(5)
    j1.publish(p1)
    j2.publish(p2)
    j3.publish(p3)
    j4.publish(p4)
    j5.publish(p5)
    j6.publish(p6)
    j7.publish(p7)

def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("/arm_controller/follow_joint_trajectory/result", FollowJointTrajectoryActionResult, callback)   
    rospy.Subscriber("/gripper_controller/follow_joint_trajectory/result", FollowJointTrajectoryActionResult, callback)   
    rospy.spin()

if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInitException:
        pass