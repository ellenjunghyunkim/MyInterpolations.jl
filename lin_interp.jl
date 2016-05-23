module MyLinInterp

  export LinearInterpolation

  immutable LinearInterpolation 
    grid::Array
    vals::Array
　end

　function Base.call(a::LinearInterpolation, x::Real)
    i = searchsortedlast(a.grid, x)
    if i == 0 || i == length(a.grid)
        return 0
 　　end
    interpolated_value = (a.vals[i+1]-a.vals[i])/(a.grid[i+1]-a.grid[i])*(x-a.grid[i])+a.vals[i]
    return interpolated_value
　　　
　end

　function Base.call{T<:Real}(a::LinearInterpolation, x::AbstractVector{T})
    n = length(x)
    out = Array(Float64, n)

    for i in 1:n
        interpolated_value = a(x[i])
        out[i] = interpolated_value
    end

    return out
　end
　　

end