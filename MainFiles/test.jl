include("makeGraph.jl")
include("walkingOnGraph.jl")

g = makeNDGraph(2, 5, 0.08)

@time g2 = makeNDGraph(7, 7, 0.08);

quit()
