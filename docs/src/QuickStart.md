# Tutorial

To quickly get you started with `Titan.jl`, let's recreate a simple example of a cantilever beam subjected to a distributed load as shown below.

First of all, load the package using the following command:

```@example quick_start
using Titan
```

To create a new model, use the `Model()` command that will initialize an empty model:

```@example quick_start
model = Model()
```

Now, we can start populating it with the rest of componets that fully define the model - nodes, supports, materials, elements, and loads - before analyzing it.

```@example quick_start
node!(model, 1, 0, 0, 0)
node!(model, 2, 1, 0, 0)
```

```@example quick_start
material!(model, 1, ElasticMaterial, 1, 1)
```

```@example quick_start
section!(model, 1, GeneralSection, 1, 1, 1, 1, 1)
```

```@example quick_start
element!(model, 1, TrussElement, 1, 2, 1, 1)
```