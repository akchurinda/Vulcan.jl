"""
    TimoshenkoBeamColumnElement

A two-node beam-column element based on the Timoshenko beam theory.
"""
struct TimoshenkoBeamColumnElement{NIT <: Real, NJT <: Real, MT <: Real, ST <: Real, OT <: Real} <: AbstractElement{NIT, NJT, MT, ST, OT}
    "Node (``i``) of the element"
    node_i::Node{NIT}
    "Node (``j``) of the element"
    node_j::Node{NJT}
    "Material of the element"
    material::AbstractMaterial{MT}
    "Section of the element"
    section::AbstractSection{ST}
    "Orientation vector that defines the local coordinate system of the element"
    orientation::Vector{OT}
    # "State of the element"
    # state::ElementState
end