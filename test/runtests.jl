using Test
using Vulcan

@testset "Test material library" begin
    
end

@testset "Test section library" begin
    
end

@testset "Test element library" begin
    
end

@testset "Test warnings: Zero-length element" begin
    model = Model()

    node!(model, 1, 0, 0, 0)
    node!(model, 2, 0, 0, 0)

    material!(model, 1, "ElasticMaterial", 1, 1)
    
    section!(model, 1, "GeneralSection", 1, 1, 1, 1, 1)

    @test_logs (:warn, "Element with ID 1 has zero length. This may lead to numerical issues.") element!(model, 1, "TrussElement", 1, 2, 1, 1)
end