mutable struct ElementState

end

abstract type AbstractElement{NIT <: Real, NJT <: Real, MT <: Real, ST <: Real, OT <: Real} end

struct TrussElement{NIT <: Real, NJT <: Real, MT <: Real, ST <: Real, OT <: Real} <: AbstractElement{NIT, NJT, MT, ST, OT}
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

function compute_Γ(element::TrussElement)
    node_i = element.node_i
    node_j = element.node_j

    L = distance(node_i, node_j)

    c_x = (node_j.x - node_i.x) / L
    c_y = (node_j.y - node_i.y) / L
    c_z = (node_j.z - node_i.z) / L

    Γ = SMatrix{2, 6}([
        c_x c_y c_z 0 0 0;
        0 0 0 c_x c_y c_z])

    return Γ
end

function compute_k_e_l(element::TrussElement)
    node_i = element.node_i
    node_j = element.node_j
    material = element.material
    section = element.section

    L = distance(node_i, node_j)

    E = material.E

    A_g = section.area

    k_e_l = SMatrix{2, 2}((E * A_g / L) * [+1 -1; -1 +1])

    return k_e_l
end

function compute_k_g_l(element::TrussElement)
    k_g_l = SMatrix{6, 6}(zeros(6, 6))

    return k_g_l
end

struct EulerBernoulliBeamColumnElement{NIT <: Real, NJT <: Real, MT <: Real, ST <: Real, OT <: Real} <: AbstractElement{NIT, NJT, MT, ST, OT}
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