abstract type AbstractMaterial{T <: Real} end

include("Material Library/ElasticMaterial.jl")
include("Material Library/ElasticPerfectlyPlasticMaterial.jl")