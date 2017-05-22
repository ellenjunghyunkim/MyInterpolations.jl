module MyInterpolations

  export LinearInterpolation

  immutable LinearInterpolation 
    grid::Array
    vals::Array
　end

　function (f::LinearInterpolation)(x)
    i = searchsortedlast(f.grid, x)
    if i == 0 || ( i == length(f.grid) && f.grid[end] !=  x )
        return 0
 　　end
    interpolated_value = (f.vals[i+1]-f.vals[i])/(f.grid[i+1]-f.grid[i])*(x-f.grid[i])+f.vals[i]
    return interpolated_value
　　　
　end
　　

end