# Quick Start

```@example quick_start
using Titan
```

```@example quick_start
model = Model()
```

```@example quick_start
node!(model, 1, 0, 0, 0)
node!(model, 2, 1, 0, 0)
```

```@example quick_start
material!(model, 1, "ElasticMaterial", 1, 1)
```

```@example quick_start
section!(model, 1, "GeneralSection", 1, 1, 1, 1, 1)
```

```@example quick_start
element!(model, 1, "TrussElement", 1, 2, 1, 1)
```