abstract type AbstractMaterial{T <: Real} end

const MATERIAL_LIBRARY = ["ElasticMaterial", "ElasticPerfectlyPlasticMaterial"]

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

struct ElasticPerfectlyPlasticMaterial{T <: Real} <: AbstractMaterial{T}
    "Young's modulus, ``E``"
    E  ::T
    "Poisson's ratio, ``\\nu``"
    ν  ::T
    "Yield stress, ``F_{y}``"
    σ_y::T

    function ElasticPerfectlyPlasticMaterial(E::Real, ν::Real, σ_y::Real)
        T = float(eltype(promote(E, ν, σ_y)))

        return new{T}(E, ν, σ_y)
    end
end