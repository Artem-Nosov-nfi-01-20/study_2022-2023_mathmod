#=
7:
- Julia version: 
- Author: Artem
- Date: 2023-03-24
=#
using DifferentialEquations, PyPlot;

function f(du, u, p, t)
    du[1] = (0.385 + 0.000025*u[1])*(N - u[1])
end

function f2(du, u, p, t)
    du[1] = (0.000014 + 0.15*u[1])*(N - u[1])
end

function f3(du, u, p, t)
    du[1] = (0.16*sin(t) + 0.18*cos(t)*u[1]) * (N - u[1])
end

range = (0, 3)
N = 1372
N0 = 6

ode = ODEProblem(f, [N0], range)
sol = solve(ode, dtmax=0.01)
n = [u[1] for u in sol.u];

clf()
plot(sol.t, sol.u, label="n(t)")
xlabel("Время, t")
ylabel("Количество людей, n(t)")
title("Случай 1")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab07\\image\\graph1.png")
clf()

ode = ODEProblem(f2, [N0], range)
sol = solve(ode, dtmax=0.01)
n = [u[1] for u in sol.u];

clf()
plot(sol.t, sol.u, label="n(t)")
xlabel("Время, t")
ylabel("Количество людей, n(t)")
title("Случай 2")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab07\\image\\graph2.png")
clf()

ode = ODEProblem(f3, [N0], range)
sol = solve(ode, dtmax=0.01)
n = [u[1] for u in sol.u];

clf()
plot(sol.t, sol.u, label="n(t)")
xlabel("Время, t")
ylabel("Количество людей, n(t)")
title("Случай 3")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab07\\image\\graph3.png")
clf()