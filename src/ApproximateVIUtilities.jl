module ApproximateVIUtilities

    using ArgCheck, ProgressMeter, ForwardDiff, LinearAlgebra, Random, Printf, Distributions, Symbolics, StatsFuns

    using StatsFuns: logistic, softplus

    include("numericalkld.jl")

    # include("plotellipse.jl")

    include("transform_symbolics.jl")

    include("importanceweights.jl")

    include("transform.jl")

    export numericalkld, convertdensity, convertdensity2, samplebase, importanceweights, getISmultinomial#, getsamplerbase # plotellipse, 
    
end
