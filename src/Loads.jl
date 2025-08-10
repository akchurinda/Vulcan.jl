abstract type AbstractLoad end

struct NodalLoad <: AbstractLoad

end

struct ElementConcentratedLoad <: AbstractLoad

end

struct ElementDistributedLoad <: AbstractLoad

end