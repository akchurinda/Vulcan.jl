abstract type AbstractSection{T <: Real} end

struct GeneralSection{T <: Real} <: AbstractSection{T}
    "Gross cross-sectional area, ``A_{g}``"
    A_g::T
    "Moment of area about the local ``z``-axis, ``I_{z}``"
    I_z::T
    "Moment of area about the local ``y``-axis, ``I_{y}``"
    I_y::T
    "St. Venant torsion constant, ``J``"
    J  ::T
    "Warping constant, ``C_{w}``"
    C_w::T

    function GeneralSection(A_g::Real, I_z::Real, I_y::Real, J::Real, C_w::Real)
        T = float(eltype(promote(A_g, I_z, I_y, J, C_w)))

        return new{T}(A_g, I_z, I_y, J, C_w)
    end
end

struct RectangularSection{T <: Real} <: AbstractSection{T}
    "Outer width, ``w_{o}``"
    w_o::T
    "Outer height, ``h_{o}``"
    h_o::T
    "Inner width, ``w_{i}``"
    w_i::T
    "Inner height, ``h_{i}``"
    h_i::T

    "Gross cross-sectional area, ``A_{g}``"
    A_g::T
    "Moment of area about the local ``z``-axis, ``I_{z}``"
    I_z::T
    "Moment of area about the local ``y``-axis, ``I_{y}``"
    I_y::T
    "St. Venant torsion constant, ``J``"
    J  ::T
    "Warping constant, ``C_{w}``"
    C_w::T

    function RectangularSection(w_o::Real, h_o::Real, w_i::Real, h_i::Real)
        T = float(eltype(promote(w_o, h_o, w_i, h_i)))

        A_g = zero(T)
        I_z = zero(T)
        I_y = zero(T)
        J   = zero(T)
        C_w = zero(T)

        return new{T}(w_o, h_o, w_i, h_i, A_g, I_z, I_y, J, C_w)
    end
end

struct CircularSection{T <: Real} <: AbstractSection{T}
    "Outer radius, ``r_{o}``"
    r_o::T
    "Inner radius, ``r_{i}``"
    r_i::T

    "Gross cross-sectional area, ``A_{g}``"
    A_g::T
    "Moment of area about the local ``z``-axis, ``I_{z}``"
    I_z::T
    "Moment of area about the local ``y``-axis, ``I_{y}``"
    I_y::T
    "St. Venant torsion constant, ``J``"
    J  ::T
    "Warping constant, ``C_{w}``"
    C_w::T

    function CircularSection(r_o::Real, r_i::Real)
        T = float(eltype(promote(r_o, r_i)))

        A_g = zero(T)
        I_z = zero(T)
        I_y = zero(T)
        J   = zero(T)
        C_w = zero(T)

        return new{T}(r_o, r_i, A_g, I_z, I_y, J, C_w)
    end
end

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

    "Gross cross-sectional area, ``A_{g}``"
    A_g  ::T
    "Moment of area about the local ``z``-axis, ``I_{z}``"
    I_z  ::T
    "Moment of area about the local ``y``-axis, ``I_{y}``"
    I_y  ::T
    "St. Venant torsion constant, ``J``"
    J    ::T
    "Warping constant, ``C_{w}``"
    C_w  ::T

    function ISection(d::Real, b_f_b::Real, b_f_t::Real, t_f_b::Real, t_f_t::Real, t_w::Real)
        T = float(eltype(promote(d, b_f_b, b_f_t, t_f_b, t_f_t, t_w)))

        A_g = zero(T)
        I_z = zero(T)
        I_y = zero(T)
        J   = zero(T)
        C_w = zero(T)

        return new{T}(d, b_f_b, b_f_t, t_f_b, t_f_t, t_w, A_g, I_z, I_y, J, C_w)
    end
end