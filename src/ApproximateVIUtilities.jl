module ApproximateVIUtilities

    using ProgressMeter, LinearAlgebra, Random, Printf, Distributions, PyPlot, Symbolics

    include("numericalkld.jl")

    include("plotellipse.jl")

    include("transform.jl")

    export plotellipse, numericalkld, transform

end
