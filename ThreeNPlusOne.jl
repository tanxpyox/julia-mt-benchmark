using ProgressMeter

println("Single thread:...")
@time begin 
  a = collect(1:1000000)
  @showprogress for i in 1:length(a)
    while a[i] != 1 
      if a[i] % 2 == 0
        a[i] = a[i] / 2
      else
        a[i] = 3 * a[i] + 1
      end
    end
  end
end

println("Multithread:...")
@time begin 
  a = collect(1:1000000)
  Threads.@threads @showprogress for i in 1:length(a)
    while a[i] != 1 
      if a[i] % 2 == 0
        a[i] = a[i] / 2
      else
        a[i] = 3 * a[i] + 1
      end
    end
  end
end
