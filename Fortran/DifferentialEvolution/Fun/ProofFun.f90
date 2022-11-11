include './Functions.f90'

program ProofFunctions
   use fun_mod
   implicit none

   real(8), dimension(2) :: x     
   
  !call random_number(x)
  x = [1.1d0,2.2d0];

  print*, 'Cosine_Mixture(x)'
  print*, Cosine_Mixture(x)
  print*, 'Griewank(x)'
  print*, Griewank(x)
  print*, 'Inverted_Cosine_Wave(x)'
  print*, Inverted_Cosine_Wave(x)
  print*, 'Michalewicz(x)'
  print*, Michalewicz(x)
  print*, 'Rastrigin(x)'
  print*, Rastrigin(x)
  print*, 'Rosenbrock(x)'
  print*, Rosenbrock(x)
  print*, 'Shubert(x)'
  print*, Shubert(x)
  print*, 'Sinusoidal_Problem(x)'
  print*, Sinusoidal_Problem(x)
  print*, 'Sphere(x)'
  print*, Sphere(x)
  print*, 'Zakharov(x)'
  print*, Zakharov(x)

  end program ProofFunctions

   !!!Pruebas de multiplicacion de matrices
   !real(8), dimension(2,2) :: x 
   !real(8) :: fr
   !integer :: D, k
   !real(8), dimension(size(x)) :: v1aD
!
   !
   !
   !call random_number(x)
   !print*, 'x'
   !write(*,('(2(f0.4,2x))')) x
   !print*, 'x * x'
   !write(*,('(2(f0.4,2x))')) x*x
!
   !D = size(x)
   !do k=1,D 
   !   v1aD(k) = k
   !end do 
   !fr = sum(x*x);
!
   !print*, 'fr'
   !print*, fr
   !!write(*,('(2(f0.4,2x))')) x*x

  !!!Potencias, exponentes y raices cuadradas
  !print*,2d0**(-1d0/2d0)
  !print*,exp(1d0)
  !print*,sqrt(4d0)