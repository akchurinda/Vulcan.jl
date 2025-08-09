using Titan

model = Model()

node!(model, 1,   0.0,   0.0, 0.0)
node!(model, 2, 100.0,   0.0, 0.0)
node!(model, 3,  50.0, 100.0, 0.0)

material!(model, 1, ElasticMaterial, 29000.0, 0.3)

section!(model, 1, RectangularSection, 5.0, 5.0, 4.5, 4.5)
section!(model, 2, RectangularSection, 2.5, 2.5, 2.0, 2.0)

element!(model, 1, TrussElement, 1, 3, 1, 1)
element!(model, 2, TrussElement, 2, 3, 1, 2)