module ApproximateVIUtilities

    using ArgCheck, ProgressMeter, ForwardDiff, LinearAlgebra, Random, Printf, Distributions, Symbolics

    using StatsFuns: logistic, softplus

    include("numericalkld.jl")

    # include("plotellipse.jl")

    include("transform_symbolics.jl")

    include("importanceweights.jl")

    export numericalkld, convertdensity, samplebase, importanceweights, getISmultinomial#, getsamplerbase # plotellipse, 
    
end
