# Vuforia
Augmented Reality platform, for computer vision. 
- includes text, object, cylinder, box, and image recognition

Vec2F, 2D vector of float items 

**Pose** is the combination of position and orientation information. 
Pose estimation can be done through analytic or geometric methods:
- camera mapping is known (since it projects 3D onto a 2D image)
- the camera's image is a known function 
- the set of control points (corners) on the object (target) are used to solve the pose transformation from a set of equations which relates the 3D coordinates of the points with their 2D image coordinates
