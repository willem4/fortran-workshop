module m_vector
   use iso_fortran_env, only: real64

   implicit none(type, external)

   private
   public :: add_vectors, equal_vectors, vector3d

   type :: vector3d
      real, dimension(3) :: xyz
      !character(len=:), allocatable :: p
      !contains 
      !  procedure(vector3d), deferred :: p => print_vector
   end type 
      
contains

   !> Only here to verify that a unit test can load this module and call one of its functions
   function add_vectors(a, b) result(res)
      type(vector3d), intent(in) :: a  
      type(vector3d), intent(in) :: b
      type(vector3d) :: res
      integer :: k
      
      res%xyz = a%xyz + b%xyz 
      
   end function add_vectors

   function equal_vectors(a, b) result(res)
      type(vector3d), intent(in) :: a  
      type(vector3d), intent(in) :: b
      logical :: res

      res = all(a%xyz == b%xyz)
      
   end function equal_vectors
   
   subroutine print_vector(self, res)
      type(vector3d), intent(in) :: self  
      character(len=:), allocatable :: res
      res = 'x=1, y=1, z=1'
   end subroutine
   
end module m_vector
