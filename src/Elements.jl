abstract type AbstractElement{
    NIT <: Real, # (N)ode (I) (T)ype
    NJT <: Real, # (N)ode (J) (T)ype
    MPT <: Real, # (M)aterial (P)roperty (T)ype
    SPT <: Real, # (S)ection (P)roperty (T)ype
    OAT <: Real} # (O)rientation (A)ngle (T)ype
end

mutable struct ElementState
    L    ::Real
    ω_i  ::Real
    ω_j  ::Real
    Γ    ::SMatrix
    k_e_l::SMatrix
    k_g_l::SMatrix
    k_e_g::SMatrix
    k_g_g::SMatrix
    q    ::SVector

    ElementState() = new()
end

function initstate!(element::AbstractElement)
    node_i = element.node_i
    node_j = element.node_j
    ω = element.orientation

    element.state.L = distance(node_i, node_j)
    element.state.ω_i = ω
    element.state.ω_j = ω
    element.state.Γ = compute_Γ(element)
    element.state.k_e_l = compute_k_e_l(element)
    element.state.k_g_l = compute_k_g_l(element)
    element.state.k_e_g = transform_l_to_g(element.state.k_e_l, element.state.Γ)
    element.state.k_g_g = transform_l_to_g(element.state.k_g_l, element.state.Γ)
    element.state.q = @SVector zeros(6)

    return element
end

include("Element Library/TrussElement.jl")
include("Element Library/EulerBernoulliBeamColumnElement.jl")
include("Element Library/TimoshenkoBeamColumnElement.jl")

function transform_l_to_g(k::SMatrix, Γ::SMatrix)
    K = transpose(Γ) * k * Γ

    return K
end