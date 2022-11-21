getmaxmass()  = 1e10

getminmass()  = 1e6

getmaxef()    = 30.0

getminef()    = 1.0

sigmoid(x)    = 1.0 / (1 + exp(-x))

invsigmoid(x) = log(x/(1-x))

function transformx2mass(x)

    sigmoid(x) * (getmaxmass() - getminmass()) + getminmass()

end

function transformx2efraction(x)

    sigmoid(x) * (getmaxef() - getminef()) + getminef()

end

function transformmass2x(mass)

    invsigmoid((mass - getminmass())/(getmaxmass() - getminmass()))
    
end

function transformefraction2x(ef)

    invsigmoid((ef - getminef())/(getmaxef() - getminef()))

end


function buildjacobian()

    @variables x y

    g = [transformx2mass(x), transformx2efraction(y)]

    J = Symbolics.jacobian(g, [x, y])

    aux = Symbolics.build_function(J, x, y, expression=Val{false})

    aux2 = Symbolics.eval(aux[1])

    (arg1, arg2) -> aux2(arg1, arg2)

end


function convertdensity(logl)

    logp(x, y) = logl([transformx2mass(x), transformx2efraction(y)])

    jac = buildjacobian()

    (x, y) -> logp(x, y) + logdet(jac(x, y))

end


function samplebase(q)

    x = rand(q)

    [transformx2mass(x[1]);transformx2efraction(x[2])]

end
