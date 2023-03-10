using PyPlot;
using DifferentialEquations;
function HiZge!(du, u, p, t)
    du[1] = (-0.64)*u[1] + 0.056*u[1]*u[2]
    du[2] = 0.46*u[2] - 0.054*u[1]*u[2]
end
const u0 = Float64[8.0, 27.0]
const uostac = Float64[0.46/0.054, 0.64/0.056]
const p = []
const tspan = [0.0, 100.0]

prob1 = ODEProblem(HiZge!,u0,tspan, p)
prob2 = ODEProblem(HiZge!,uostac,tspan, p)
sol1 = solve(prob1, dtmax=0.05)
sol2 = solve(prob2, dtmax=0.05)

R1 = [tu[1] for tu in sol1.u]
R2 = [tu[2] for tu in sol1.u]


clf()
plot(R2, R1)
xlabel("Жертвы, шт")
ylabel("Хищники, шт")
title("Численность жертв в зависимости от хищников")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab05\\report\\image\\g1.png")
clf()

plot(sol1.t, R1, label="Хищники", color="crimson")
plot(sol1.t, R2, label="Жертвы", color="darkblue")
xlabel("Время")
title("Число хищников и жертв в зависимости от времени")
legend(loc=1)
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab05\\report\\image\\g2.png")
clf()

R1 = [tu[1] for tu in sol2.u]
R2 = [tu[2] for tu in sol2.u]

clf()
plot(R2, R1, "ro")
xlabel("Жертвы, шт")
ylabel("Хищники, шт")
title("Численность жертв в зависимости от хищников")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab05\\report\\image\\g3.png")
clf()

plot(sol2.t, R1, label="Хищники", color="crimson")
plot(sol2.t, R2, label="Жертвы", color="darkblue")
xlabel("Время")
title("Число хищников и жертв в зависимости от времени")
legend()
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab05\\report\\image\\g4.png")
clf()