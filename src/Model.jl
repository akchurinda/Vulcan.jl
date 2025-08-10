"""
    Model

A finite element model of a structure of interest.
"""
@kwdef struct Model
    "Nodes of the model"
    nodes::OrderedDict{Int, Node} = OrderedDict{Int, Node}()
    "Elements of the model"
    elements::OrderedDict{Int, AbstractElement} = OrderedDict{Int, AbstractElement}()
    "Materials of the model"
    materials::OrderedDict{Int, AbstractMaterial} = OrderedDict{Int, AbstractMaterial}()
    "Sections of the model"
    sections::OrderedDict{Int, AbstractSection} = OrderedDict{Int, AbstractSection}()
end

"""
    node!(model, id, x, y, z)

A function that adds a node to the model with the given ID and coordinates.
"""
function node!(model::Model, id::Int, x::Real, y::Real, z::Real)
    # Check if the node ID already exists in the model:
    haskey(model.nodes, id) && throw(ArgumentError("Node with ID $(id) already exists."))

    # Create a new node and add it to the model:
    model.nodes[id] = Node(x, y, z)
    
    # Return the updated model:
    return model
end

"""
    material!(model, id, type, properties...)

A function that adds a material of the given type to the model with the given ID and properties.
"""
function material!(model::Model, id::Int, type::Type{D}, properties...) where {D <: AbstractMaterial}
    # Check if the material ID already exists in the model:
    haskey(model.materials, id) && throw(ArgumentError("Material with ID $(id) already exists."))

    # Create a new material:
    material = type(properties...)

    # Add the material to the model:
    model.materials[id] = material

    # Return the updated model:
    return model
end

"""
    section!(model, id, type, properties...)

A function that adds a section of the given type to the model with the given ID and properties.
"""
function section!(model::Model, id::Int, type::Type{D}, properties...) where {D <: AbstractSection}
    # Check if the section ID already exists in the model:
    haskey(model.sections, id) && throw(ArgumentError("Section with ID $(id) already exists."))

    # Check if the properties are valid for the section type:
    section = type(properties...)

    # Add the section to the model:
    model.sections[id] = section

    # Return the updated model:
    return model
end

"""
    element!(model, id, type, node_i_id, node_j_id, material_id, section_id; orientation = [1, 0, 0])

A function that adds an element of the given type to the model with the given ID, nodes, material, section, and orientation.
"""
function element!(model::Model, id::Int, type::Type{D}, node_i_id::Int, node_j_id::Int, material_id::Int, section_id::Int; orientation::Vector{<:Real} = [1, 0, 0]) where {D <: AbstractElement}
    # Check if the element ID already exists in the model and if the nodes, material, and section exist:
    haskey(model.elements, id) && throw(ArgumentError("Element with ID $(id) already exists."))
    haskey(model.nodes, node_i_id) || throw(ArgumentError("Node with ID $(node_i_id) does not exist."))
    haskey(model.nodes, node_j_id) || throw(ArgumentError("Node with ID $(node_j_id) does not exist."))
    haskey(model.materials, material_id) || throw(ArgumentError("Material with ID $(material_id) does not exist."))
    haskey(model.sections, section_id) || throw(ArgumentError("Section with ID $(section_id) does not exist."))

    # Extract the nodes, material, and section from the model:
    node_i = model.nodes[node_i_id]
    node_j = model.nodes[node_j_id]

    # Extract the material:
    material = model.materials[material_id]

    # Extract the section:
    section = model.sections[section_id]

    # Create the element with the specified type, nodes, material, section, and orientation:
    element = type(node_i, node_j, deepcopy(material), deepcopy(section), orientation)

    # Add the element to the model:
    model.elements[id] = element

    # Check if the element is a zero-length element:
    L = distance(node_i, node_j)
    isapprox(L, 0) && @warn "Element with ID $(id) is a zero-length element. The element was created, but note that this may lead to numerical issues."

    # Return the updated model:
    return model
end

function nodalload!()

end

function elementconcload!()

end

function elementdistload!()

end