module ApproximateVIUtilities

    using ArgCheck, ProgressMeter, ForwardDiff, LinearAlgebra, Random, Printf, Distributions, PyPlot

    using StatsFuns: logistic, softplus

    include("numericalkld.jl")

    include("plotellipse.jl")

    include("transform.jl")

    # include("transform2.jl")

    export plotellipse, numericalkld, convertdensity
    
end
