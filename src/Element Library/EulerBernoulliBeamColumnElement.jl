"""
    EulerBernoulliBeamColumnElement

A two-node beam-column element based on the Euler-Bernoulli beam theory.
"""
struct EulerBernoulliBeamColumnElement{
    NIT <: Real,
    NJT <: Real,
    MPT <: Real,
    SPT <: Real,
    OAT <: Real} <: AbstractElement{NIT, NJT, MPT, SPT, OAT}
    "Node (``i``) of the element"
    node_i::Node{NIT}
    "Node (``j``) of the element"
    node_j::Node{NJT}
    "Material of the element"
    material::AbstractMaterial{MPT}
    "Section of the element"
    section::AbstractSection{SPT}
    "Orientation vector that defines the local coordinate system of the element"
    orientation::OAT
    "State of the element"
    state::ElementState
end