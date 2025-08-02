module TitanMakieExtension
using Makie
using Titan
import Titan: plotmodel, plotmodel!

@recipe PlotModel (titan_model, ) begin
    node_color = :red
    node_strokecolor = :black
    node_strokewidth = 1
    node_id_visible = true
    node_id_color = :red

    element_color = :black
    element_id_visible = true
    element_id_color = :black

    Makie.mixin_generic_plot_attributes()...
end

Makie.preferred_axis_type(::PlotModel) = Makie.Axis

function Makie.plot!(plotmodel::PlotModel)
    model = plotmodel.titan_model[]
    
    elements = model.elements
    if !isempty(model.elements)
        for (id, element) in elements
            node_i = element.node_i
            node_j = element.node_j

            x_i, y_i, z_i = node_i.x, node_i.y, node_i.z
            x_j, y_j, z_j = node_j.x, node_j.y, node_j.z

            Makie.lines!(plotmodel, [x_i, x_j], [y_i, y_j], [z_i, z_j],
                color = plotmodel.element_color)

            if plotmodel.element_id_visible[]
                Makie.text!(plotmodel, (x_i + x_j) / 2, (y_i + y_j) / 2, (z_i + z_j) / 2,
                    text = "E" * string(id),
                    color = plotmodel.element_id_color)
            end
        end
    end

    nodes = model.nodes
    if !isempty(model.nodes)
        for (id, node) in nodes
            x, y, z = node.x, node.y, node.z

            Makie.scatter!(plotmodel, node.x, node.y, node.z, 
                color = plotmodel.node_color,
                strokecolor = plotmodel.node_strokecolor,
                strokewidth = plotmodel.node_strokewidth)

            if plotmodel.node_id_visible[]
                Makie.text!(plotmodel, x, y, z,
                    text = "N" * string(id),
                    color = plotmodel.node_id_color)
            end
        end
    end

    return plotmodel
end
end