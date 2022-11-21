module ApproximateVIUtilities

    using ArgCheck, ProgressMeter, ForwardDiff, LinearAlgebra, Random, Printf, Distributions, PyPlot

    using StatsFuns: logistic, softplus

    include("numericalkld.jl")

    include("plotellipse.jl")

    include("transform.jl")

    export plotellipse, numericalkld, convertdensity, getsamplerbase
    
end
