module Vulcan
using Reexport
@reexport using OrderedCollections

struct Node{T<:Real}
    x::T
    y::T
    z::T

    function Node(x, y, z)
        T = eltype(promote(x, y, z))

        return new{T}(x, y, z)
    end
end

struct Material{T<:Real}
    E::T
    ν::T
    ρ::T

    function Material(E, ν, ρ)
        T = eltype(promote(E, ν, ρ))

        return new{T}(E, ν, ρ)
    end
end

struct Section{T<:Real}
    A.  ::T
    I_zz::T
    I_yy::T
    J.  ::T

    function Section(A, I_zz, I_yy, J)
        T = eltype(promote(A, I_zz, I_yy, J))

        return new{T}(A, I_zz, I_yy, J)
    end
end

struct Element
    node_i::Node
    node_j::Node
    material::Material
    section::Section
end

@kwdef struct Model
    nodes    ::OrderedDict{Int, Node    } = OrderedDict{Int, Node    }()
    materials::OrderedDict{Int, Material} = OrderedDict{Int, Material}()
    sections ::OrderedDict{Int, Section } = OrderedDict{Int, Section }()
    elements ::OrderedDict{Int, Element } = OrderedDict{Int, Element }()
end

function define_node!(model::Model, id::Int, x, y, z)
    # Ensure that the node ID does not already exist in the model:
    haskey(model.nodes, id) && throw(ArgumentError("Node with ID $(id) already exists."))

    # Create the node:
    node = Node(x, y, z)

    # Add the node to the model:
    model.nodes[id] = node
    
    # Return the updated model:
    return model
end

function define_material!(model::Model, id::Int, E, ν, ρ)
    # Ensure that the material ID does not already exist in the model:
    haskey(model.materials, id) && throw(ArgumentError("Material with ID $(id) already exists."))

    # Create the material:
    material = Material(E, ν, ρ)

    # Add the material to the model:
    model.materials[id] = material
    
    # Return the updated model:
    return model
end

function define_section!(model::Model, id::Int, A, I_zz, I_yy, J)
    # Ensure that the section ID does not already exist in the model:
    haskey(model.sections, id) && throw(ArgumentError("Section with ID $(id) already exists."))

    # Create the section:
    section = Section(A, I_zz, I_yy, J)

    # Add the section to the model:
    model.sections[id] = section
    
    # Return the updated model:
    return model
end

function define_element!(model::Model, id::Int, node_i_id::Int, node_j_id::Int, material_id::Int, section_id::Int)
    # Ensure that the element ID does not already exist in the model:
    haskey(model.elements, id) && throw(ArgumentError("Element with ID $(id) already exists."))

    # Ensure that the nodes exist in the model:
    haskey(model.nodes, node_i_id) || throw(ArgumentError("Node with ID $(node_i_id) does not exist."))
    haskey(model.nodes, node_j_id) || throw(ArgumentError("Node with ID $(node_j_id) does not exist."))

    # Ensure that the material exists in the model:
    haskey(model.materials, material_id) || throw(ArgumentError("Material with ID $(material_id) does not exist."))

    # Ensure that the section exists in the model:
    haskey(model.sections, section_id) || throw(ArgumentError("Section with ID $(section_id) does not exist."))

    # Extract the nodes from the model:
    node_i = model.nodes[node_i_id]
    node_j = model.nodes[node_j_id]

    # Extract the material from the model:
    material = model.materials[material_id]

    # Extract the section from the model:
    section = model.sections[section_id]

    # Create the element:
    element = Element(node_i, node_j, material, section)

    # Add the element to the model:
    model.elements[id] = element
    
    # Return the updated model:
    return model
end

export Node, Material, Section, Element, Model
export node!, material!, section!, element!
end
