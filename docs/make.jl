push!(LOAD_PATH, "../src/")

using Documenter
using Titan

makedocs(
    sitename = "Titan.jl",
    authors = "Damir Akchurin",
    pages = [
        "Home" => "index.md",
        "Quick Start" => "QuickStart.md",
        "Documentation" => [
            "Model" => "Model.md",
            "Materials" => "Materials.md",
            "Sections" => "Sections.md",
            "Elements" => "Elements.md",
            "Loads" => "Loads.md"],
        "Automatic Differentiation" => "AutomaticDifferentiation.md"])

deploydocs(
    repo="github.com/akchurinda/Titan.jl")