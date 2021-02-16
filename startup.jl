# Comments

# Will be setting up a time to discuss this portion of the assignment. I will be very curious how the rest of the class did with this assignment.
# I did attempt to do it alone but I struggled a lot and had no idea how to implement my own simulation in code from what we've covered in class
# more code based exmaples of what is expected of us to produce later would be very beneficial in learning for this class

# I really had no clue where to begin to produce a simulation or implement the inverse kinematics we discussed in class in code

import Pkg;
Pkg.activate(@__DIR__);
using LinearAlgebra, StaticArrays
using RigidBodyDynamics, RigidBodySim
using MeshCat, MeshCatMechanisms
vis = Visualizer();open(vis)


function display_urdf(urdfPath,vis)
    # Displays mechanism at config all zeros
    # urdfPath must be a string
    mechanism = parse_urdf(Float64,urdfPath)
    state = MechanismState(mechanism)
    zero_configuration!(state);
    mvis = MechanismVisualizer(mechanism, URDFVisuals(urdfPath),vis)
    manipulate!(state) do x
        set_configuration!(mvis, configuration(x))
    end
    return mvis, mechanism
end


display_urdf("lush-robot.urdf",vis)
