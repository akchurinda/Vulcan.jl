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

function node!(model::Model, id::Int, x::Real, y::Real, z::Real)
    if haskey(model.nodes, id)
        error("Node with ID $(id) already exists.")
    end

    model.nodes[id] = Node(x, y, z)
    
    return model
end

function material!(model::Model, id::Int, type::String, properties...)
    if type ∉ MATERIAL_LIBRARY
        closest, _ = findnearest(type, MATERIAL_LIBRARY, Levenshtein())
        error("""
            Material type "$(type)" is not supported. Did you mean $(closest)?
            Supported material types are: $(MATERIAL_LIBRARY).""")
    end

    if haskey(model.materials, id)
        error("Material with ID $(id) already exists.")
    end

    material = eval(Symbol(type))(properties...)

    model.materials[id] = material

    return model
end

function section!(model::Model, id::Int, type::String, properties...)
    if type ∉ SECTION_LIBRARY
        closest, _ = findnearest(type, SECTION_LIBRARY, Levenshtein())
        error("""
            Section type "$(type)" is not supported. Did you mean $(closest)?
            Supported section types are: $(SECTION_LIBRARY).""")
    end

    if haskey(model.sections, id)
        error("Section with ID $(id) already exists.")
    end

    section = eval(Symbol(type))(properties...)

    model.sections[id] = section

    return model
end

function element!(model::Model, id::Int, type::String, node_i_id::Int, node_j_id::Int, material_id::Int, section_id::Int; orientation::Vector{<:Real} = [1, 0, 0])
    if type ∉ ELEMENT_LIBRARY
        closest, _ = findnearest(type, ELEMENT_LIBRARY, Levenshtein())
        error("""
            Element type "$(type)" is not supported. Did you mean $(closest)?
            Supported element types are: $(ELEMENT_LIBRARY).""")
    end

    if haskey(model.elements, id)
        error("Element with ID $(id) already exists.")
    end

    node_i = model.nodes[node_i_id]
    node_j = model.nodes[node_j_id]

    L = distance(node_i, node_j)

    if isapprox(L, 0)
        @warn "Element with ID $(id) has zero length. This may lead to numerical issues."
    end

    material = model.materials[material_id]
    section = model.sections[section_id]

    element = eval(Symbol(type))(node_i, node_j, deepcopy(material), deepcopy(section), orientation)

    model.elements[id] = element

    return model
end