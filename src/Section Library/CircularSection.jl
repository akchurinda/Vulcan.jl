"""
    CircularSection

Circular section with outer and inner radii.
"""
struct CircularSection{T <: Real} <: AbstractSection{T}
    "Radius, ``r``"
    r::T

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

    function CircularSection(r::Real)
        T = float(typeof(r))

        A   = zero(T)
        I_z = zero(T)
        I_y = zero(T)
        J   = zero(T)
        C_w = zero(T)

        return new{T}(r, A, I_z, I_y, J, C_w)
    end
end