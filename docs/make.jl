push!(LOAD_PATH, "../src/")

using Documenter
using Vulcan

makedocs(
    sitename = "Vulcan.jl",
    authors  = "Damir Akchurin",
    pages    = [
        "Home"        => "index.md",
        "Quick Start" => "QuickStart.md",
        "Documentation" => [
            "Materials" => "Materials.md",
            "Sections"  => "Sections.md",
            "Elements"  => "Elements.md",
            "Loads"     => "Loads.md"]])

deploydocs(
    repo = "github.com/akchurinda/Vulcan.jl")