# Vuforia
Augmented Reality platform, for computer vision. 
- includes text, object, cylinder, box, and image recognition

Vec2F, 2D vector of float items 

**Pose** is the combination of position and orientation information. 
Pose estimation can be done through analytic or geometric methods:
- camera mapping is known (since it projects 3D onto a 2D image)
- the camera's image is a known function 
- the set of control points (corners) on the object (target) are used to solve the pose transformation from a set of equations which relates the 3D coordinates of the points with their 2D image coordinates

- [Trackable](https://developer.vuforia.com/library/sites/default/api/java/classcom_1_1vuforia_1_1Trackable.html) 
  - [ObjectTarget](https://developer.vuforia.com/library/sites/default/api/java/classcom_1_1vuforia_1_1ObjectTarget.html) 
    - [ImageTarget](https://developer.vuforia.com/library/sites/default/api/java/classcom_1_1vuforia_1_1ImageTarget.html); flat target, inherited from ObjectTarget
- [Marker](https://developer.vuforia.com/library/sites/default/api/java/classcom_1_1vuforia_1_1Marker.html#details)
- [Renderer](https://developer.vuforia.com/library/sites/default/api/java/classcom_1_1vuforia_1_1Renderer.html#details)

# Rajawali
Rajawali is a 3D engine for rendering and lighting. Vuforia will be the computer vision to detect where objects should render, Rajawali handles rendering.

**Attenuation** is the gradual loss of intensity. Rajawali's [light](https://github.com/Rajawali/Rajawali/tree/master/rajawali/src/main/java/org/rajawali3d/lights) classes provide different types of light sources. Light sources should be relative to the image target.

Android sensor will give overall lighting of the scene:
- [Android Light Sensor](http://stackoverflow.com/questions/4738294/android-detect-brightness-amount-of-light-in-phones-surroundings-using-the-c) Integration
