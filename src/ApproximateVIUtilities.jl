module ApproximateVIUtilities

    using ArgCheck, ProgressMeter, ForwardDiff, LinearAlgebra, Random, Printf, Distributions, Symbolics

    using StatsFuns: logistic, softplus

    include("numericalkld.jl")

    # include("plotellipse.jl")

    include("transform_symbolics.jl")

    export numericalkld, convertdensity, samplebase#, getsamplerbase # plotellipse, 
    
end
