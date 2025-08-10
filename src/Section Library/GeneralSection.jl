"""
    GeneralSection

General section.
"""
struct GeneralSection{T <: Real} <: AbstractSection{T}
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

    function GeneralSection(A::Real, I_z::Real, I_y::Real, J::Real, C_w::Real)
        T = float(eltype(promote(A, I_z, I_y, J, C_w)))

        return new{T}(A, I_z, I_y, J, C_w)
    end
end