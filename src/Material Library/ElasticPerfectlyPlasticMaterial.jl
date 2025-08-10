"""
    ElasticPerfectlyPlasticMaterial

A material that follows Hooke's law up to a yield stress, after which it behaves perfectly plastically.
"""
struct ElasticPerfectlyPlasticMaterial{T <: Real} <: AbstractMaterial{T}
    "Young's modulus, ``E``"
    E  ::T
    "Poisson's ratio, ``\\nu``"
    ν  ::T
    "Yield stress, ``\\sigma_{y}``"
    σ_y::T

    function ElasticPerfectlyPlasticMaterial(E::Real, ν::Real, σ_y::Real)
        T = float(eltype(promote(E, ν, σ_y)))

        return new{T}(E, ν, σ_y)
    end
end