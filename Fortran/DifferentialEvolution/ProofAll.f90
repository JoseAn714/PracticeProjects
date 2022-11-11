include './DE_Method/DE_mod.f90'
include './Fun/Functions.f90'

 !main program
 program ProofAllFunctionsDE
  use DE_mod
  use fun_mod
  implicit none
  
  integer, parameter :: m = 2000, n = 2, gmax = 100
  real(8), parameter :: F = 1d0, Cr = 0.5, PI=4d0*DATAN(1d0)
  !real(8), parameter, dimension(n) :: bL = [-5d0,-5d0], bU = [5d0,5d0]
  !Para función Michalewicz:
  real(8), parameter, dimension(n) :: bL = [0d0,0d0], bU = [PI,PI]
  character(len=1), parameter :: variante = 'D'
  real(8), dimension(n) :: mejor
  real(8) :: minimo, tm, t1, tT

  call cpu_time(t1)
 
  call DE_Method(Cosine_Mixture,bL,bU,m,gmax,Cr,F,variante,minimo,mejor,tm)
  print*, ' '
  print*, 'Cosine_Mixture'
  print*, 'Mejor'
  write(*,('(2(f0.4,2x))')) mejor 
  print*, 'Minimo'
  write(*,('(f0.6)')) minimo
  print*, 'Tiempo:', tm

  call DE_Method(Griewank,bL,bU,m,gmax,Cr,F,variante,minimo,mejor,tm)
  print*, ' '
  print*, 'Griewank'
  print*, 'Mejor'
  write(*,('(2(f0.4,2x))')) mejor 
  print*, 'Minimo'
  write(*,('(f0.6)')) minimo
  print*, 'Tiempo:', tm

  call DE_Method(Inverted_Cosine_Wave,bL,bU,m,gmax,Cr,F,variante,minimo,mejor,tm)
  print*, ' '
  print*, 'Inverted_Cosine_Wave'
  print*, 'Mejor'
  write(*,('(2(f0.4,2x))')) mejor 
  print*, 'Minimo'
  write(*,('(f0.6)')) minimo
  print*, 'Tiempo:', tm

  call DE_Method(Michalewicz,bL,bU,m,gmax,Cr,F,variante,minimo,mejor,tm)
  print*, ' '
  print*, 'Michalewicz'
  print*, 'Mejor'
  write(*,('(2(f0.4,2x))')) mejor 
  print*, 'Minimo'
  write(*,('(f0.6)')) minimo
  print*, 'Tiempo:', tm

  call DE_Method(Rastrigin,bL,bU,m,gmax,Cr,F,variante,minimo,mejor,tm)
  print*, ' '
  print*, 'Rastrigin'
  print*, 'Mejor'
  write(*,('(2(f0.4,2x))')) mejor 
  print*, 'Minimo'
  write(*,('(f0.6)')) minimo
  print*, 'Tiempo:', tm

  call DE_Method(Rosenbrock,bL,bU,m,gmax,Cr,F,variante,minimo,mejor,tm)
  print*, ' '
  print*, 'Rosenbrock'
  print*, 'Mejor'
  write(*,('(2(f0.4,2x))')) mejor 
  print*, 'Minimo'
  write(*,('(f0.6)')) minimo
  print*, 'Tiempo:', tm

  call DE_Method(Shubert,bL,bU,m,gmax,Cr,F,variante,minimo,mejor,tm)
  print*, ' '
  print*, 'Shubert'
  print*, 'Mejor'
  write(*,('(2(f0.4,2x))')) mejor 
  print*, 'Minimo'
  write(*,('(f0.6)')) minimo
  print*, 'Tiempo:', tm

  call DE_Method(Sinusoidal_Problem,bL,bU,m,gmax,Cr,F,variante,minimo,mejor,tm)
  print*, ' '
  print*, 'Sinusoidal_Problem'
  print*, 'Mejor'
  write(*,('(2(f0.4,2x))')) mejor 
  print*, 'Minimo'
  write(*,('(f0.6)')) minimo
  print*, 'Tiempo:', tm

  call DE_Method(Sphere,bL,bU,m,gmax,Cr,F,variante,minimo,mejor,tm)
  print*, ' '
  print*, 'Sphere'
  print*, 'Mejor'
  write(*,('(2(f0.4,2x))')) mejor 
  print*, 'Minimo'
  write(*,('(f0.6)')) minimo
  print*, 'Tiempo:', tm

  call DE_Method(Zakharov,bL,bU,m,gmax,Cr,F,variante,minimo,mejor,tm)
  print*, ' '
  print*, 'Zakharov'
  print*, 'Mejor'
  write(*,('(2(f0.4,2x))')) mejor 
  print*, 'Minimo'
  write(*,('(f0.6)')) minimo
  print*, 'Tiempo:', tm

  call cpu_time(tT)
  print*, ' '
  print*, 'Tiempo Total:', tT - t1 
 
 end program ProofAllFunctionsDE