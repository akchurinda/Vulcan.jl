module Titan
using OrderedCollections
using StaticArrays
using StyledStrings
using StringDistances

export Node
export AbstractMaterial, ElasticMaterial
export AbstractSection, GeneralSection, RectangularSection, CircularSection
export AbstractElement, TrussElement, EulerBernoulliBeamColumnElement, TimoshenkoBeamColumnElement
export Model
export node!, material!, section!, element!
export plotmodel
export plotmodel!

include("Nodes.jl")
include("Materials.jl")
include("Sections.jl")
include("Elements.jl")
include("Models.jl")

include("Utilities/PrettyPrinting.jl")
include("Utilities/Plotting.jl")
end