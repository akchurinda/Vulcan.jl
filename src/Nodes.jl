mutable struct NodeState
    U::Vector{<:Real}
    F::Vector{<:Real}

    # Constructor:
    NodeState() = new()
end

"""
    Node

A three-dimensional node with coordinates ``(x, y, z)``.
"""
struct Node{T <: Real}
    "``x``-coordinate"
    x::T
    "``y``-coordinate"
    y::T
    "``z``-coordinate"
    z::T
    "State of the node"
    # state::NodeState

    function Node(x::Real, y::Real, z::Real)
        T = float(eltype(promote(x, y, z)))

        return new{T}(x, y, z)
    end
end

distance(node_i::Node, node_j::Node) = sqrt(
    (node_i.x - node_j.x) ^ 2 + 
    (node_i.y - node_j.y) ^ 2 + 
    (node_i.z - node_j.z) ^ 2)