#!/usr/bin/env python3
import rospy
from std_msgs.msg import Float32
from sensor_msgs.msg import JointState
from control_msgs.msg import FollowJointTrajectoryActionResult

def callback(data):
    rospy.Subscriber("joint_states", JointState, callback_pos)

def callback_pos(data):
    print ("Position1: ", data.position[1])
    p = data.position[1]
    pub = rospy.Publisher("pos1",Float32,queue_size=10)
    rate = rospy.Rate(5)
    # while not rospy.is_shutdown():
    pub.publish(p)

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