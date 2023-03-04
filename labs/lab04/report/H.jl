using DifferentialEquations
using PyPlot;



# Определяем уравнение гармонического осциллятора без затуханий и без внешней силы
function harm_oscillator_without_damping(du, u, p, t)
    du[1] = u[2]
    du[2] = -5.5 * u[1]
end

# Определяем начальные условия
u0 = [0.5, 0.0]
tspan = (0.0, 55.0)

prob = ODEProblem(harm_oscillator_without_damping, u0, tspan)
sol = solve(prob, dtmax=0.05)

x =[tu[1] for tu in sol.u]
y =[tu[2] for tu in sol.u]

clf()
plot(x, y)
title("Определяем уравнение гармонического осциллятора без затуханий и без внешней силы")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab04\\image\\g1.png")
clf()


# Определяем уравнение гармонического осциллятора с затуханием и без внешней силы
function harm_oscillator_with_damping(du, u, p, t)
    du[1] = u[2]
    du[2] = -0.5 * u[2] - 5 * u[1]
end

# Определяем начальные условия для второго случая
u0 = [0.5, -0.5]
tspan = (0.0, 55.0)

# Решаем уравнение гармонического осциллятора с затуханием и без внешней силы
prob = ODEProblem(harm_oscillator_with_damping, u0, tspan)
sol = solve(prob, dtmax=0.05)

x =[tu[1] for tu in sol.u]
y =[tu[2] for tu in sol.u]

clf()
plot(x, y)
title("Определяем уравнение гармонического осциллятора с затуханием и без внешней силы")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab04\\image\\g2.png")
clf()


# Определяем уравнение гармонического осциллятора с затуханием и под воздействием внешней силы
function harm_oscillator_with_external_force(du, u, p, t)
    du[1] = u[2]
    du[2] = -5 * u[2] - 0.5 * u[1] + 0.5 * cos(5 * t)
end

# Определяем начальные условия для третьего случая
u0 = [-0.5, 0.5]
tspan = (0.0, 55.0)

# Решаем уравнение гармонического осциллятора с затуханием и под воздействванием внешней силы
prob = ODEProblem(harm_oscillator_with_external_force, u0, tspan)
sol = solve(prob, dtmax=0.05)

x =[tu[1] for tu in sol.u]
y =[tu[2] for tu in sol.u]

clf()
plot(x, y)
title("Определяем уравнение гармонического осциллятора с затуханием и под воздействием внешней силы")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab04\\image\\g3.png")
clf()
