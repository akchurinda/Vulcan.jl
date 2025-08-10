"""
    ISection

I-section.
"""
struct ISection{T <: Real} <: AbstractSection{T}
    "Depth, ``d``"
    d    ::T
    "Bottom flange width, ``b_{f, b}``"
    b_f_b::T
    "Top flange width, ``b_{f, t}``"
    b_f_t::T
    "Bottom flange thickness, ``t_{f, b}``"
    t_f_b::T
    "Top flange thickness, ``t_{f, t}``"
    t_f_t::T
    "Web thickness, ``t_{w}``"
    t_w  ::T

    "Cross-sectional area, ``A``"
    A  ::T
    "Moment of area about the local ``z``-axis, ``I_{z}``"
    I_z::T
    "Moment of area about the local ``y``-axis, ``I_{y}``"
    I_y::T
    "St. Venant torsion constant, ``J``"
    J  ::T
    "Warping constant, ``C_{w}``"
    C_w::T

    function ISection(d::Real, b_f_b::Real, b_f_t::Real, t_f_b::Real, t_f_t::Real, t_w::Real)
        T = float(eltype(promote(d, b_f_b, b_f_t, t_f_b, t_f_t, t_w)))

        A   = zero(T)
        I_z = zero(T)
        I_y = zero(T)
        J   = zero(T)
        C_w = zero(T)

        return new{T}(d, b_f_b, b_f_t, t_f_b, t_f_t, t_w, A, I_z, I_y, J, C_w)
    end
end