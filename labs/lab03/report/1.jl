using PyPlot;
using DifferentialEquations;
function AvsA!(du, u, p, t)
    du[1] = -0.49*u[1] -0.688*u[2] + abs(cos(2*t))
    du[2] = -0.388*u[1] -0.39*u[2] + abs(sin(2*t))
end
function AvsP!(du, u, p, t)
    du[1] = -0.225*u[1] - 0.774*u[2] + abs(sin(2*t)+1)
    du[2] = -0.331*u[1]*u[2] - 0.665*u[2] + cos(t) +2
end
const u0 = Float64[331000.0, 225000.0]
const tspan = [0.0, 7.0]
prob1 = ODEProblem(AvsA!,u0,tspan)
prob2 = ODEProblem(AvsP!,u0,tspan)
sol1 = solve(prob1)
sol2 = solve(prob2);

R1 = [tu[1] for tu in sol1.u]
R2 = [tu[2] for tu in sol1.u]
Q1 = [tu[1] for tu in sol2.u]
Q2 = [tu[2] for tu in sol2.u]

clf()
plot(R1, R2)
axis([0.0,331000.0,0.0,225000.0])
xlabel("army X")
ylabel("army Y")
title("Регулярные армии X и Y")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab04\\image\\graph1.png")
clf()
plot(sol1.t, R1)
axis([0.0,7.0,0.0,331000.0])
xlabel("time")
ylabel("army X")
title("Регулярная армия X")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab03\\image\\graph1_x.png")
clf()
plot(sol1.t, R2)
axis([0.0, 7.0, 0.0, 225000.0])
xlabel("time")
ylabel("army Y")
title("Регулярная армия Y")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab03\\image\\graph1_y.png")
clf()
plot(Q1, Q2)
axis([0.0,331000.0,0.0,225000.0])
xlabel("army X")
ylabel("army Y")
title("Регулярная армия X и партизанская армия Y")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab03\\image\\graph2.png")
clf()
plot(sol2.t, Q1)
axis([0.0,7.0,0.0,331000.0])
xlabel("time")
ylabel("army X")
title("Регулярная армия X")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab03\\image\\graph2_x.png")
clf()
plot(sol2.t, Q2)
axis([0.0,7.0,0.0,225000.0])
xlabel("time")
ylabel("army Y")
title("Партизанская армия Y")
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab03\\image\\graph2_y.png")
clf()