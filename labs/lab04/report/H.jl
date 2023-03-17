using Plots

# Constants
const G = 6.67430e-11  # Gravitational constant [m^3 kg^-1 s^-2]
const M_sun = 1.98847e30  # Solar mass [kg]
const M_J = 1.89819e27  # Jupiter mass [kg]
const R_J = 6.9911e7  # Jupiter radius [m]
const R_inner = 0.1 * 1.496e11  # Inner boundary [m]
const R_outer = 100 * 1.496e11  # Outer boundary [m]
const M_star = 1 * M_sun  # Stellar mass [kg]

# Functions
function get_rho(r)
    if r < 5 * R_J
        return 2.0
    elseif r < 50 * R_J
        return 1.0
    else
        return 0.5
    end
end

function get_m(p, r)
    rho = get_rho(r)
    return 4.0/3.0 * pi * (p^3 - (p-1)^3) * rho * r^3
end

function get_r_acc(m)
    return 2.0 * G * M_star / (3.0 * m)
end

# Initialization
p = 2.0  # Initial density profile parameter
r = R_inner  # Initial radius
m = get_m(p, r)  # Initial mass
r_acc = get_r_acc(m)  # Initial accretion radius

r_values = [r]
m_values = [m]

while r < R_outer
    # Accretion
    delta_m = 0.0
    delta_r = r_acc / 10.0
    while delta_m < 0.9 * r_acc
        delta_m += get_m(p, r + delta_r) - get_m(p, r)
        r += delta_r
    end
    m += delta_m
    r_acc = get_r_acc(m)

    # Update density profile parameter
    p = p + 0.01 * randn()

    # Save values
    push!(r_values, r)
    push!(m_values, m)
end

# Plot the results
plot(r_values, m_values, xaxis=:log, yaxis=:log, xlabel="Radius [m]", ylabel="Mass [kg]", legend=false)