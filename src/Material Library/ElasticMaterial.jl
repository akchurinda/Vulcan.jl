"""
    ElasticMaterial

A material that follows Hooke's law.
"""
struct ElasticMaterial{T <: Real} <: AbstractMaterial{T}
    "Young's modulus, ``E``"
    E::T
    "Poisson's ratio, ``\\nu``"
    ν::T

    function ElasticMaterial(E::Real, ν::Real)
        T = float(eltype(promote(E, ν)))

        return new{T}(E, ν)
    end
end