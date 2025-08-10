module Titan
using OrderedCollections
using StaticArrays
using StyledStrings
using StringDistances

export Node
export AbstractMaterial, ElasticMaterial, ElasticPerfectlyPlasticMaterial
export AbstractSection, GeneralSection, RectangularSection, CircularSection, ISection
export AbstractElement, TrussElement, EulerBernoulliBeamColumnElement, TimoshenkoBeamColumnElement
export Model
export node!, material!, section!, element!
export plotmodel
export plotmodel!

include("Nodes.jl")
include("Materials.jl")
include("Sections.jl")
include("Elements.jl")
include("Model.jl")

include("Utilities/PrettyPrinting.jl")
include("Utilities/Plotting.jl")
end