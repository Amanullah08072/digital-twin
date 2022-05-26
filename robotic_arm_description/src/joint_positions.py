#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import JointState
from control_msgs.msg import FollowJointTrajectoryActionResult

def callback(data):
    rospy.Subscriber("joint_states", JointState, callback_pos)

def callback_pos(data):
    print ("Position: ", data.position)

def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("/arm_controller/follow_joint_trajectory/result", FollowJointTrajectoryActionResult, callback)   
    rospy.Subscriber("/gripper_controller/follow_joint_trajectory/result", FollowJointTrajectoryActionResult, callback)   
    rospy.spin()

if __name__ == '__main__':
    listener()