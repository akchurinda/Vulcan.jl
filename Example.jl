using Titan

model = Model()

node!(model, 1,   0.0,   0.0, 0.0)
node!(model, 2, 100.0,   0.0, 0.0)
node!(model, 3,  50.0, 100.0, 0.0)

material!(model, "ElasticMaterial", 1, 29000.0, 0.3)

section!(model, "RectangularSection", 1, 5.0, 5.0, 4.5, 4.5)
section!(model, "RectangularSection", 2, 2.5, 2.5, 2.0, 2.0)

element!(model, "TrussElement", 1, 1, 3, 1, 1)
element!(model, "TrussElement", 2, 2, 3, 1, 2)