using DifferentialEquations, PyPlot

# задаем начальные условия
N = 10060 # общее число людей на острове
I0 = 61 # число заболевших в начальный момент времени
R0 = 23 # число людей с иммунитетом к болезни в начальный момент времени
S0 = N - I0 - R0 # число восприимчивых к болезни людей в начальный момент времени

# задаем параметры модели
α = 0.4 # коэффициент передачи инфекции
β = 0.1 # коэффициент выздоровления

# задаем функцию правых частей системы дифференциальных уравнений
function fn_1(du, u, p, t)
    S, I, R = u
    α, β = p
    du[1] = 0
	du[2] = - β * I
	du[3] = β * I
end

# задаем начальное время, конечное время и шаг по времени
tspan = (0.0, 100.0)
dt = 0.01

# задаем начальные условия
u0 = [S0, I0, R0]

# решаем систему дифференциальных уравнений
prob1 = ODEProblem(fn_1, u0, tspan, [α, β])
sol1 = solve(prob1, Tsit5(), dt=dt)

S1 = [u[1] for u in sol1.u]
I1 = [u[2] for u in sol1.u]
R1 = [u[3] for u in sol1.u]
T1 = [timestamp for timestamp in sol1.t]

clf()
plot(T1, I1, label="Численность заболевших относительно времени", color="green")
plot(T1, R1, label="Численность выздоровевших относительно времени", color="blue")
plot(T1, S1, label="Численность с иммунитетом относительно времени", color="pink")
title("Число всех подгрупп в зависимости от времени\nпри I(0) I(0) ≤ I∗")
legend(loc=1)
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab06\\image\\g1.png")
clf()

function fn_2(du, u, p, t)
	S, I, R = u
    α, β = p
	du[1] = - α * S
	du[2] = α * S - β * I
	du[3] = β * I
end

prob2 = ODEProblem(fn_2, u0, tspan, [α, β])
sol2 = solve(prob2, Tsit5(), dt=dt)

S2 = [u[1] for u in sol2.u]
I2 = [u[2] for u in sol2.u]
R2 = [u[3] for u in sol2.u]
T2 = [timestamp for timestamp in sol2.t]

clf()
plot(T2, I2, label="Численность заболевших относительно времени", color="green")
plot(T2, R2, label="Численность выздоровевших относительно времени", color="blue")
plot(T2, S2, label="Численность с иммунитетом относительно времени", color="pink")
title("Число всех подгрупп в зависимости от времени\nпри I(0) I(0) > I∗")
legend(loc=1)
savefig("C:\\Users\\HyperPC\\Documents\\GitHub\\study_2022-2023_mathmod\\labs\\lab06\\image\\g2.png")
clf()
