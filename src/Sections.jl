abstract type AbstractSection{T <: Real} end

include("Section Library/GeneralSection.jl")
include("Section Library/RectangularSection.jl")
include("Section Library/CircularSection.jl")
include("Section Library/ISection.jl")