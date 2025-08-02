function Base.show(io::IO, model::Model)
    nn = length(model.nodes    )
    nm = length(model.materials)
    ns = length(model.sections )
    ne = length(model.elements )

    if nn == 0 && nm == 0 && ns == 0 && ne == 0
        output = styled"{yellow, bold:Empty model.}"
    else
        output =  styled"{cyan, bold:Model with:}\n"
        output *= "├─ # of nodes:     $(nn) \n"
        output *= "├─ # of materials: $(nm) \n"
        output *= "├─ # of sections:  $(ns) \n"
        output *= "└─ # of elements:  $(ne)   "
    end

    print(io, output)

    return nothing
end