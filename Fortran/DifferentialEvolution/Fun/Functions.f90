module fun_mod
    implicit none 
    private 
 
    public :: Cosine_Mixture, Griewank, Inverted_Cosine_Wave, & 
    Michalewicz, Rastrigin, Rosenbrock, Shubert, Sinusoidal_Problem, &
    Sphere, Zakharov
 
 contains
 
   function Cosine_Mixture(x) result(fr)
      real(8), intent(in), dimension(:) :: x 
      real(8), parameter :: PI=4d0*DATAN(1d0)
      real(8) :: fr 
    
      fr = sum(x*x)-0.1*sum(cos(5*PI*x));

   end function Cosine_Mixture

   function Griewank(x) result(fr)
      real(8), intent(in), dimension(:) :: x 
      real(8) :: fr
      integer :: D, k
      real(8), dimension(size(x)) :: v1aD

      D = size(x)
      do k=1,D 
         v1aD(k) = k
      end do 
      fr = 1d0 + sum(x*x)/4000d0 - product(cos(x/sqrt(v1aD)));

   end function Griewank

   function Inverted_Cosine_Wave(x) result(fr)
      real(8), intent(in), dimension(:) :: x 
      real(8) :: fr
      integer :: D, i
      real(8), dimension(size(x)-1) :: vector
    
      D = size(x)
      do i = 1, D-1
         vector(i) = &
         exp( -( x(i)**2d0 + x(i+1)**2d0 + 0.5d0*x(i)*x(i+1) )/8d0 ) &
         *cos(4*sqrt( x(i)**2d0 + x(i+1)**2d0 + 0.5d0*x(i)*x(i+1) ))
      end do 
      fr = -sum(vector);

   end function Inverted_Cosine_Wave

   function Michalewicz(x) result(fr) 
   !Nota de función: únicamente con los límites de 0 a PI
      !Para D=2 -> Mínimo = -1.8013 en x =(2.20,1.57)
      !Para D=5 -> Mínimo = -4.687658
      !Para D=10 -> Mínimo = -9.66015
      real(8), intent(in), dimension(:) :: x 
      real(8), parameter ::  PI=4d0*DATAN(1d0)
      real(8) :: fr
      integer :: D, k
      real(8), dimension(size(x)) :: i 

      D = size(x)
      do k=1,D 
         i(k) = k
      end do 

      fr =  -sum( sin(x) * sin((i*x**2d0)/PI)**20d0 );

   end function Michalewicz

   function Rastrigin(x) result(fr) 
      real(8), intent(in), dimension(:) :: x 
      real(8), parameter ::  PI=4d0*DATAN(1d0)
      real(8) :: fr
      integer :: D

      D = size(x)
      fr =  10d0*D + sum(x*x) - 10*sum(cos(2d0*PI*x));

   end function Rastrigin
   
   function Rosenbrock(x) result(fr) 
      real(8), intent(in), dimension(:) :: x 
      real(8), parameter ::  PI=4d0*DATAN(1d0)
      real(8) :: fr
      integer :: D, i
      real(8), dimension(size(x)-1) :: vector

      D = size(x)
      do i = 1, D-1
         vector(i) = (x(i) - 1)**2d0 + &
         100d0*( x(i+1) - x(i)**2d0 )**2d0
      end do 
      fr = sum(vector);

   end function Rosenbrock
   
   function Shubert(x) result(fr) 
      real(8), intent(in), dimension(:) :: x 
      real(8) :: fr
      integer :: i
      real(8), dimension(5,2) :: matrix

      do i = 1, 5
         matrix(i,1) = i*cos( (i+1)*x(1) + i );
         matrix(i,2) = i*cos( (i+1)*x(2) + i );
      end do 
      fr = sum( matrix(:,1) ) * sum( matrix(:,2) );

   end function Shubert
   
   function Sinusoidal_Problem(x) result(fr) 
      real(8), intent(in), dimension(:) :: x
      real(8), parameter :: A = 2.5, B = 5, z = 30
      real(8) :: fr

      fr = - A*product( sin( x - z ) ) - product( sin( B*(x - z) ) );

   end function Sinusoidal_Problem

   function Sphere(x) result(fr) 
      real(8), intent(in), dimension(:) :: x
      real(8) :: fr

      fr = sum(x*x);

   end function Sphere

   function Zakharov(x) result(fr) 
      real(8), intent(in), dimension(:) :: x
      real(8) :: fr
      integer ::  D, k
      real(8), dimension(size(x)) :: i 


      D = size(x)
      do k = 1, D
         i(k) = k
      end do 

      fr = sum(0.5d0*i*x)**2d0 + sum(0.5d0*i*x)**4d0;

   end function Zakharov
 
 end module fun_mod

