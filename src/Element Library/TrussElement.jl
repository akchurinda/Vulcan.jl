"""
    TrussElement

A classical two-node truss element.
"""
struct TrussElement{
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

get_node_type(::Node{NT}) where {NT} = NT
get_material_type(::AbstractMaterial{MPT}) where {MPT} = MPT
get_section_type(::AbstractSection{SPT}) where {SPT} = SPT
get_element_type(::AbstractElement{NIT, NJT, SPT, MPT, OAT}) where {NIT, NJT, SPT, MPT, OAT} = promote_type(NIT, NJT, SPT, MPT, OAT)

function compute_Γ(element::TrussElement)
    node_i = element.node_i
    node_j = element.node_j

    L = distance(node_i, node_j)

    c_x = (node_j.x - node_i.x) / L
    c_y = (node_j.y - node_i.y) / L
    c_z = (node_j.z - node_i.z) / L

    Γ = @SMatrix [
        c_x c_y c_z 0 0 0;
        0 0 0 c_x c_y c_z]

    return Γ
end

function compute_k_e_l(element::TrussElement)
    node_i = element.node_i
    node_j = element.node_j
    L = distance(node_i, node_j)

    material = element.material
    E = material.E

    section = element.section
    A = section.A

    k_e_l = @SMatrix [
        +E * A / L -E * A / L; 
        -E * A / L +E * A / L]

    return k_e_l
end

function compute_k_g_l(element::TrussElement)
    k_g_l = @SMatrix zeros(2, 2)

    return k_g_l
end