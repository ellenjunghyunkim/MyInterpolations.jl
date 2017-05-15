module MyInterpolations

  export LinearInterpolation

  immutable LinearInterpolation 
    grid::Array
    vals::Array
　end

　function (a::LinearInterpolation)(x::Real)
    i = searchsortedlast(grid, x)
    if i == 0 || i == length(grid)
        return 0
 　　end
    interpolated_value = (vals[i+1]-vals[i])/(grid[i+1]-grid[i])*(x-grid[i])+vals[i]
    return interpolated_value
　　　
　end

　function func{T<:Real}(x::AbstractVector{T})
        y = zeros(length(x))
        for i in 1:length(x)
            y[i] = func(x[i])
        end
        return y
    end

end
