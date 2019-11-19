
## **Circular Modal Transition Notes**

The idea behind making this circular animation work is that when we tap on the button, we need to understand its frame. We need to use that frame to create a mask, and that mask will start sitting on top of the button, and expand and take over the entire viewController. And that will expose and reveal the controller we’re transitioning onto.

So the first thing we need to do is expand the frame of the button.
