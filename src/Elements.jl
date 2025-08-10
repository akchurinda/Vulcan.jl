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
    Γ    ::Matrix{<:Real}
    q    ::Vector{<:Real}
    k_e_l::Matrix{<:Real}
    k_g_l::Matrix{<:Real}
    k_e_g::Matrix{<:Real}
    k_g_g::Matrix{<:Real}

    ElementState() = new()
end

